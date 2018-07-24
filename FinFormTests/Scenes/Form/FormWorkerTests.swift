//
//  FormWorkerTests.swift
//  FinFormTests
//
//  Created by Gustavo on 24/07/18.
//  Copyright © 2018 Sore. All rights reserved.
//

@testable import FinForm
import XCTest

class FormWorkerTests: XCTestCase
{
    // MARK: - Subject under test
    
    var sut: FormWorker!
    
    // MARK: - Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupFormWorker()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupFormWorker()
    {
        sut = FormWorker()
    }
    
    // MARK: Tests
    
    func testValidateEmailShouldValidateEmailsCorrectly()
    {
        // When
        
        let isFirstWrongEmailInvalid = sut.validateEmail(email: Seeds.Email.firstWrongEmail)
        let isSecondWrongEmailInvalid = sut.validateEmail(email: Seeds.Email.secondWrongEmail)
        
        let isFirstCorrectEmailInvalid = sut.validateEmail(email: Seeds.Email.firstCorrectEmail)
        let isSecondCorrectEmailInvalid = sut.validateEmail(email: Seeds.Email.secondCorrectEmail)
        
        // Then
        
        XCTAssert(!isFirstWrongEmailInvalid, "ValidateEmail() should validate email correctly")
        XCTAssert(!isSecondWrongEmailInvalid, "ValidateEmail() should validate email correctly")
        
        XCTAssert(isFirstCorrectEmailInvalid, "ValidateEmail() should validate email correctly")
        XCTAssert(isSecondCorrectEmailInvalid, "ValidateEmail() should validate email correctly")
    }
    
    func testValidateTelNumberShouldValidateTelNumbersCorrectly()
    {
        // When
        
        let invalidTelNumber = sut.validateTelNumber(telNumber: Seeds.TelNumber.invalidTelNumber)
        let validTelNumber = sut.validateTelNumber(telNumber: Seeds.TelNumber.telNumberWithMask)
        
        // Then
        
        XCTAssert(!invalidTelNumber, "ValidateTelNumber() should validate tel number correctly")
        XCTAssert(validTelNumber, "ValidateTelNumber() should validate tel number correctly")
    }
    
    func testValidateFormShouldValidateFormCorrectly()
    {
        // When
        
        let invalidFormWrongMetaData = sut.validateForm(arrayMetaData: [Seeds.CellsMetaData.wrongEmail,Seeds.CellsMetaData.wrongTelNumber,Seeds.CellsMetaData.requiredWithoutValue])
        let invalidFormRequiredMetaData = sut.validateForm(arrayMetaData: [Seeds.CellsMetaData.requiredWithoutValue])
        let validFormWrongMetaData = sut.validateForm(arrayMetaData: [Seeds.CellsMetaData.first,Seeds.CellsMetaData.second,Seeds.CellsMetaData.requiredWithValue])
        
        // Then
        
        XCTAssert(invalidFormWrongMetaData != nil, "ValidateForm() should validate form correctly")
        XCTAssert(invalidFormRequiredMetaData != nil, "ValidateForm() should validate form correctly")
        XCTAssert(validFormWrongMetaData == nil, "ValidateForm() should validate form correctly")
    }
    
    func testDidSelectShouldShowOrHideOtherMetaData()
    {
        // When
        
        let shouldShowOtherMetaDataArray = [Seeds.CellsMetaData.requiredWithValue,Seeds.CellsMetaData.second,Seeds.CellsMetaData.checkBox,Seeds.CellsMetaData.third]
        var metaData = Seeds.CellsMetaData.second
        metaData.isHidden = false
        let shouldHideOtherMetaDataArray = [Seeds.CellsMetaData.requiredWithValue,metaData,Seeds.CellsMetaData.checkBox,Seeds.CellsMetaData.third]
        
        let shouldShowResult = sut.didSelect(cellMetaData: Seeds.CellsMetaData.checkBox, arrayMetaData: shouldShowOtherMetaDataArray)
        let shouldHideResult = sut.didSelect(cellMetaData: Seeds.CellsMetaData.checkBox, arrayMetaData: shouldHideOtherMetaDataArray)
        
        // Then
        
        XCTAssert(shouldShowResult.cellMetaData.cell!.id! == Seeds.CellsMetaData.second.cell!.id!, "DidSelect() should return the correct meta data")
        XCTAssert(shouldShowResult.show, "DidSelect() should return the correct action to do with the meta data")
        
        XCTAssert(shouldHideResult.cellMetaData.cell!.id! == Seeds.CellsMetaData.second.cell!.id!, "DidSelect() should return the correct meta data")
        XCTAssert(!shouldHideResult.show, "DidSelect() should return the correct action to do with the meta data")
    }
    
    func testGenerateMetaDataArrayShouldGenerateArrayMetaDataFromCellsArray()
    {
        // When
        
        let cells = [Seeds.Cells.firstCell,Seeds.Cells.secondCell,Seeds.Cells.thirdCell]
        let arrayMetaData = sut.generateMetaDataArray(cells: cells)
        
        // Then
        
        XCTAssert(cells.count == arrayMetaData.count, "GenerateMetaDataArray() should return an array with the same count of the cells array")
    }
    
    func testTelNumberMaskShouldApplyTelMaskCorrectly()
    {
        // When
        
        let firstTelNumberWithMask = sut.telNumberMask(numbers: Seeds.TelNumber.telNumberWithoutMask)
        let secondTelNumberWithMask = sut.telNumberMask(numbers: Seeds.TelNumber.telNumberWithoutMaskLessDigits)
        
        //Then
        
        XCTAssert(firstTelNumberWithMask == Seeds.TelNumber.telNumberWithMask, "TelNumberMask() should apply tel mask correctly")
        XCTAssert(secondTelNumberWithMask == Seeds.TelNumber.invalidTelNumber, "TelNumberMask() should apply tel mask correctly")
    }
    
    func testRestartCellsMetaDataShouldRestartMetaDataArrayCorrectly()
    {
        //When
        
        let arrayMetaData = sut.restartCellsMetaData(arrayMetaData: [Seeds.CellsMetaData.first,Seeds.CellsMetaData.second,Seeds.CellsMetaData.third,Seeds.CellsMetaData.checkBox])
        
        for metaData in arrayMetaData{
            XCTAssert(metaData.textValue.isEmpty, "RestartCellsMetaData() should reset all meta data text value")
            XCTAssert(metaData.cell!.hidden! == metaData.isHidden, "RestartCellsMetaData() should reset all meta data isHidden property equal original value from cell object")
            XCTAssert(metaData.selected == false, "RestartCellsMetaData() should reset all meta data select property")
            XCTAssert(metaData.fieldState == .Default, "RestartCellsMetaData() should reset all meta data field state to default")
        }
    }
    
}
