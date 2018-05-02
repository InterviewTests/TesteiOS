# Santander

# Swift-Project

This is an example of iOS API using swift.

iOS project has the following configuration:

* Targets
  * Santander project Production Target.

* Project Configuration
  * Swift language.
 
  * `podfile` containing most used libraries by us.
    - Alamofire  for HTTP requests
    - ObjectMapper, SwiftyJSON for parsing and handling JSON
    - SwiftyValidators to validate forms
    - Toast for popup view notify if fields are not valid

  * `stkeys` in the folder `utils` containing:
    - url for the santander funds  `https://floating-mountain-50292.herokuapp.com/fund.json`
    - url for the santander cells  `https://floating-mountain-50292.herokuapp.com/cells.json`
  * `unit-tests`
    - Unit test with XCTest
  * `patterns`
    - Architecture: Viper

    
* Networking
  * `Alamofire` networking library.


##### Usage

Clone the repository:

```shell
git clone https://github.com/andrevinic/TesteiOS.git
```
Run `pod install` script in terminal:

