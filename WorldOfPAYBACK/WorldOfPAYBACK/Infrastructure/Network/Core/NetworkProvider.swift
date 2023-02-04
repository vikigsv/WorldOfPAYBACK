//
//  NetworkProvider.swift
//  WorldOfPayback
//
//  Created by Vignesh on 04/02/2023.
//

import Foundation
import Combine

protocol NetworkSession {
    func request(request: URLRequest) -> AnyPublisher<URLSession.DataTaskPublisher.Output, NetworkError>
}

class NetworkProvider {
    
    private let session: NetworkSession
    
    let disposeBag = DisposeBag()
    init(session: NetworkSession) {
        self.session = session
    }
    
    func perform<T: Decodable>(target: NetworkTarget) -> AnyPublisher<T, NetworkError> {
        Future<T, NetworkError> { promise in
            self.networkReachability()
                .sink { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        promise(.failure(error))
                    }
                } receiveValue: { _ in
                    self.executeTarget(target: target)
                        .sink { completion in
                            switch completion {
                            case .failure(let error):
                                promise(.failure(error))
                            case .finished:
                                break
                            }
                        } receiveValue: { result in
                            promise(.success(result))
                        }
                        .store(in: self.disposeBag)
                    
                }
                .store(in: self.disposeBag)
        }
        .eraseToAnyPublisher()
    }
    
    private func executeTarget<T: Decodable>(target: NetworkTarget) -> AnyPublisher<T, NetworkError> {
        switch target.stub {
        case .never:
            return sendRequest(target: target)
        case .now:
            return stubRequest(target: target)
        case .delay(let interval):
            return stubRequest(target: target, delay: interval)
        }
    }
    
    private func networkReachability() -> AnyPublisher<Bool, NetworkError> {
        Future<Bool, NetworkError> { promise in
            if NetworkReachability.isConnectedToNetwork() == false {
                promise(.failure(NetworkError.notConnected))
            } else {
                promise(.success(true))
            }
        }
        .eraseToAnyPublisher()
    }
    
    private func request(target: NetworkTarget) -> AnyPublisher<URLRequest, NetworkError> {
        Endpoint(target: target).urlRequest()
    }
    
    private func sendRequest<T: Decodable>(target: NetworkTarget) -> AnyPublisher<T, NetworkError> {
        request(target: target)
            .flatMap({ self.sendRequest(request: $0, target: target )})
            .eraseToAnyPublisher()
    }
    
    private func sendRequest<T: Decodable>(request: URLRequest, target: NetworkTarget) -> AnyPublisher<T, NetworkError> {
        session.request(request: request)
            .tryMap({ data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                      let allowedStatusCode = target.statusCodeValidationType.statusCodes,
                      allowedStatusCode ~= httpResponse.statusCode else {
                    throw NetworkError.error(statusCode: (response as? HTTPURLResponse)?.statusCode ?? 0)
                }
                return data
            })
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError({ .decodeError($0) })
            .eraseToAnyPublisher()
    }
    
}

extension NetworkProvider {
    
    private func stubRequest<T: Decodable>(target: NetworkTarget, delay: TimeInterval = 0.0) -> AnyPublisher<T, NetworkError> {
        request(target: target)
            .flatMap({ self.fetchStubMockData(request: $0, target: target, delay: delay)})
            .eraseToAnyPublisher()
    }
    
    private func fetchStubMockData<T: Decodable>(request: URLRequest, target: NetworkTarget, delay: TimeInterval) -> AnyPublisher<T, NetworkError> {
        Future<T, NetworkError> { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                do {
                    let response = try JSONDecoder().decode(T.self, from: target.mockData)
                    promise(.success(response))
                } catch {
                    promise(.failure(.decodeError(error)))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
}
