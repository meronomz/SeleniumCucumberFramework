Feature: Login and Delete Account

#  Scenario: Login with valid credentials and delete account

#    Given Launch browser
#    And Navigate to url "http://automationexercise.com"
#    Then Verify that home page is visible successfully
#    When Click on "Signup / Login" button
#    Then Verify "Login to your account" is visible
#    When Enter correct email address and password
#    And Click "login" button
#    Then Verify that "Logged in as username" is visible
#    When Click "Delete Account" button
#    Then Verify that "ACCOUNT DELETED!" is visible

  Background: Given I am on the OpenCart login page

  Scenario: Successful login with valid credentials
    Given I have entered a valid username and password
    When I click on the login button
    Then I should be logged in successfully

  Scenario Outline: Unsuccessful login with invalid or empty credentials
    Given I have entered invalid "<username>" and "<password>"
    When I click on the login button
    Then I should see an error message indicating "<error_message>"

    Examples:
      | username          | password        | error_message                                         |
      | invalid@email.com | invalidPassword | Warning: No match for E-Mail Address and/or Password. |
      | abcccc            | validPassword   | Warning: No match for E-Mail Address and/or Password. |
      | valid@email.com   | abccc           | Warning: No match for E-Mail Address and/or Password. |

  Scenario: Navigating to the forgotten password page
    When I click on the "Forgotten Password" link
    Then I should be redirected to the password reset page