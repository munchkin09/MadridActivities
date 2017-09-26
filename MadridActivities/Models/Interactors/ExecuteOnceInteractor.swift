//
//  ExecuteOnceInteractor.swift
//  MadridShop
//
//  Created by Carlos Ledesma on 18/9/17.
//  Copyright © 2017 Carlos Ledesma. All rights reserved.
//

protocol ExecuteOnceInteractor {
    func execute(closure: () -> Void)
}
