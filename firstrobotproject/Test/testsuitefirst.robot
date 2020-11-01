*** Settings ***
Library    SeleniumLibrary   
Library    ../test.py
Suite Setup    Log    I am in testsuite Setup
Suite Teardown    Log  I am in Testsuite Teardown
Test Setup    Log  i am in Test Setup
Test Teardown    Log  i am inside Test Teardown
*** Test Cases ***
myfirsttest
    Log    Hello world ...    

mytwotest
    Log    Hello world ... 

threeTest
    Log    Hello world ...     

SeleniumTestCase
    Open Browser   ${URL}     chrome
    LoginKW
    Click Element     id= welcome
    Wait Until Element Is Enabled    link=Logout    timeout=10
    #Wait Until Element Is Visible    link=Logout    timeout=10
    
    Click Element     link=Logout    
    Close Browser
    Log  this is enviroment veriabels by %{username} and %{os}    
   
    
*** Variables ***
# Variable types
#Scalar,List,dictionary,enviromrnt,builtin

#Scalaer
${URL}    https://opensource-demo.orangehrmlive.com/ 

#List

@{Credentials}  Admin  admin123

#Dictionay

&{LoginData}      user=Admin     password=admin123

*** Keywords ***
LoginKW
    
    Input Text        id=txtUsername   @{Credentials}[0]
    Input Password    id= txtPassword  &{LoginData}[password]
    Click Button      id=btnLogin        
