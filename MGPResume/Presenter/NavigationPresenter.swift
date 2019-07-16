
import Foundation

final class NavigationPresenter {
    func createExperiencePresenter(from presenter: InformationPresenterProtocol?) -> ExperiencePresenter {
        guard let presenter = presenter else {
            return ExperiencePresenter()
        }
        
        let experiencePresenter = ExperiencePresenter(service: presenter.getInjectedService())
        experiencePresenter.setExperience(presenter.getExperiences())
        
        return experiencePresenter
    }
    
    func createInformationPresenter(_ service: ApiService = ApiService()) -> InformationPresenter {
        return InformationPresenter(service)
    }
}
