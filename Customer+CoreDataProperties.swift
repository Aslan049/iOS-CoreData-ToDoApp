//
//  Customer+CoreDataProperties.swift
//  iOSCoreData
//
//  Created by Aslan Korkmaz on 26.04.2025.
//
//

import Foundation
import CoreData


extension Customer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customer> {
        return NSFetchRequest<Customer>(entityName: "Customer")
    }

    @NSManaged public var detail: String?
    @NSManaged public var title: String?

}

extension Customer : Identifiable {

}
