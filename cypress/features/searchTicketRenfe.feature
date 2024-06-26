Feature: Search for tickets on RENFE

As a user who needs to travel by train i want to be able to access the Renfe website to search for and select a ticket

Scenario Outline: view of available trains
  Given the user is on the Renfe home page
  When the user enters origin "<origin>", destination "<destination>", departure date "<departure_date>" and return date "<return_date>"
  And the user click on search ticket button
  Then the website should show a list of available trains according to origin "<origin>" and destination "<destination>" searched

  Examples:
  | origin | destination          | departure_date | return_date |
  | A Coru | Santiago De Composte | 3              | 4           |
  | Madri  | Barcelon             | 3              | 4           |
  | Valenc | Alicant              | 3              | 4           |

Scenario: selection of trains available
  Given the user is on the select your trip page
  When the user selects a list of available trains
  Then the website should show a form to complete de travelers information

Scenario Outline: empty fields in data form
  Given the user is on the traveler data page
  When the user does not complete the required fields name "<name>", first lastname "<first_lastname>", DNI "<DNI>" and phone "<phone>"
  And the user click on customize trip button
  Then the fields should be painted red and the error "<error>" will be marked below

  Examples:
  | name  | first_lastname | DNI       | phone     | error                                |
  |       | Rivera         | 12345678z | 637709563 | El nombre es obligatorio.            |
  | Pablo |                | 12345678z | 637709563 | El primer apellido es obligatorio.   |
  | Pablo | Rivera         |           | 637709563 | El documento es un campo obligatorio |
  | Pablo | Rivera         | 12345678z |           | El teléfono es un campo obligatorio  |

Scenario: data form completed successfully
  Given the user is on the traveler data page
  When the user does complete the required fields name, first lastname, DNI and phone
  And the user click on customize trip button
  Then the website should show me a page to customize my trip

Scenario: continue trip without personalizing
  Given the user is on the customize your trip page
  When the user click the continue with the purchase button
  Then the website should show a form to select the payment method
 
Scenario: payment form completed successfully with credit card
  Given the user is on the payment method page
  When the user does complete the required fields email and phone
  And the user selects the card payment method
  And the user accepts the website conditions
  And the user click on finalize your purchase button
  Then the website should redirect me to the payment gateway

Scenario: empty fields in payment form
  Given the user is on the payment method page
  When the user does not complete the required fields email and phone
  And the user selects the card payment method
  And the user accepts the website conditions
  And the user click on finalize your purchase button 
  Then the website should show a pop up with an error message

Scenario: finalize purchase button disabled
  Given the user is on the payment method page
  When the user does not complete the required fields email and phone
  And the user does not select a payment method
  And the user does not accept the website conditions
  Then the finalize your purchase button must be disabled