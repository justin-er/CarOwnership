# CarOwnership

This project has been created to show how to have an iOS application with clean architecture while we are using NSFetchedResultsController.

Probably the NSFetchedResutlsController makes the tightest coupling between UI and another layers of an iOS application. NSFetchedResutlsController Class has been created by Apple to provide a seamless data flow from Core Data layer to UIKit and vice a versa. The MVC is Apple’s native architecture and NSFetchedResultsController lays in the Model layer of this architecture perfectly but it cannot provide features like unit testing, low coupling, and independency. You might say that the lack of these possibilities is due to the MVC’s nature. I would answer yes, but these features are very important for having a well-structured application that is readable, testable, maintainable, and extendable. So if you value these traits, you do not have any problems with having some more small files in your project and you love Clean Architecture, keep on reading this article.

The main goal is using Core Data and UIKit frameworks in an application with clean architecture. To be clear, none of the modules on the inner layers should depend on the modules on the outer layers, furthermore, all modules should depend only on protocols. Only for memorising clean architecture I added it hear form Uncle Bob’s Clean Architecture book:

![](https://amirrezaeghtedari.com/wp-content/uploads/2020/05/Clean-Architecture-Layers.png)

Hereafter I will call NSFetchedResultsController “Nfc” for the sake of simplicity.

To begin with, let’s tell you that I have tested different programming methods like extending the Nfc class and defining generic protocols for generalizing my solution, but finally, I concluded that the best way is to keep it as simple as possible. To do so, I create a wrapper around Nfc which is called data provider. The Data provider is a place that all database interactions happen there. In fact, it is the only class in the app that imports the CoreData framework. It is a good sign of decoupling. To do that, the data provider conforms to two protocols and depends on another protocol as a delegate. Let’s explain that by a simple application which is called CarOwnership.

There are four entities in the app. I mean by the entity phrase, the entities that are explained in the clean architecture. So those are the enterprise-wide objects and place in the innermost layer of the clean architecture circles. So these four entities are Person, Car, Manufacturer, and Ownership. There are four swift structs with the same names to simulate these entities in the app. To explain the relationships briefly, each Car should have a Manufacturer and each Person can have nothing, one or more Cars. And finally, each Ownership document shows the details of a car that belongs to a person. Ownership application easily shows ownership documents in a table view in the first scene which is sectioned by the name of the owners. The app also persists the data using three managed objects which are called ManagedPerson, ManagedCar, and ManagedManufacturer using Core Data.

The app also contains five main modules. View, Interactor, Data Provider, Presenter, and Composer. The names are self-descriptive but I’d like to point that the composer is responsible for both composing and navigation. Even though it might be controversial, I like this idea and it is not the main point in this article. The following graph illustrates the control flow between these modules.

![](https://amirrezaeghtedari.com/wp-content/uploads/2020/05/Control-Flow.png)

The following UML class diagram also shows the modules in more details:

![](https://amirrezaeghtedari.com/wp-content/uploads/2020/05/Ownership-Architectue-1024x662.png)

## Data Provider
The ownership data provider is a wrapper around Nfc in which all core data interactions happen and it implements two protocols which I mentioned earlier:

* OwnershiopDataSource
* OwnershipDataProviderInput

The OwnershipDataSource defines all the services that the data provider should provide for the presenter to act as a data source for representing data. Implementing these properties and methods is pretty straight forward because almost all of them have Nfc counterparts.





