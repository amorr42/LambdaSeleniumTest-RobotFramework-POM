*** Settings ***
Library  SeleniumLibrary
Library  ImageHorizonLibrary
Library  BuiltIn
Library  Process
Variables   ../PageObject/Locators.py

*** Keywords ***
Open my browser
    [Arguments]     ${url}  ${browser}
    open browser    ${url}  ${browser}
    maximize browser window

Click AcceptTerm
    click element  ${btn_acceptTerm}

Enter Username
    [Arguments]     ${username}
    input text      ${txt_loginUserName}  ${username}

Enter Password
    [Arguments]     ${password}
    input text      ${txt_loginPassword}   ${password}

Click SignIn
    click button    ${btn_signIn}

Enter Mail
    [Arguments]     ${mail_address}
    page should contain  ${login_success}
    wait until element is visible  ${txt_mail}  2s
    input text      ${txt_mail}  ${mail_address}

Click Populate
    page should contain textfield  ${txt_mail}  ${mail_address}
    click button    ${btn_populate}

Verify Alert
    alert should be present  ${mail_address}

Click Radio Button Months
    click button     ${btn_months}

Click CheckBox
    wait until element is enabled  ${btn_months}  1s
    scroll element into view  ${btn_checkbox}
    select checkbox  ${btn_customer}
    select checkbox  ${btn_discounts}
    wait until element contains  ${btn_dropdown}  ${txt_options}  1s

Click DropDown List
    [Arguments]     ${txt_options}
    page should contain list   ${btn_dropdown}
    select from list by label  ${btn_dropdown}  ${txt_options}

Verify CheckBox
    select checkbox  ${btn_checkbox}
    wait until element is enabled  ${btn_checkbox}  2s

Move Slider
    [Arguments]     ${X_offset}     ${Y_offset}
    scroll element into view    ${txt_feedback}
    drag and drop by offset     ${locator}      ${X_offset}     ${Y_offset}

Share Feedback
    [Arguments]     ${comment}
    input text      ${txt_feedback}     ${comment}
    page should contain element  ${txt_feedback}  ${comment}

Open new tab
    press combination  Key.CTRL  Key.T

Open second browser
    go to   ${url2}

Download Image
    mouse down on image  ${image}
    page should contain image  ${image}
    wait until element is visible  ${image}  2s
    ${image_url}=  get element attribute  ${image}  ${image_src}
    log to console  ${image_url}
    run process  curl  -o  jenkins.svg  ${image_url}

Scroll and Wait
    scroll element into view  ${submit}
    wait until element is visible  ${upload_image}  2s

Upload Image
    choose file  ${file_path}  ${image_path}

Verify Image Alert
    alert should be present  ${image_title}

Click Submit Button
    wait until element is visible  ${submit}
    click button  ${submit}

Verify Submit Form Message
    scroll element into view  ${form_title}
    wait until page contains  ${verify_submitMessage}  2s
    close all browsers