*** Settings ***
Library  SeleniumLibrary
Library  ImageHorizonLibrary
Library  BuiltIn
Library  Process
Resource  ../Resources/LoginKeywords.robot



*** Test Cases ***
Login Test
    set selenium implicit wait  2s
    get selenium implicit wait
    open my browser     ${url}  ${browser}
    click acceptterm
    enter username      ${username}
    enter password      ${password}
    click signin
*** Test Cases ***
Survey Test
    set selenium speed  0.1
    get selenium speed
    enter mail  ${mail_address}
    click populate
    sleep  1s
    verify alert

    click radio button months
    click checkbox
    click dropdown list  ${txt_options}

    verify checkbox
    move slider  ${X_offset}  ${Y_offset}
    share feedback  ${comment}

    open new tab
    sleep  2 seconds

    ${WindowHandles}=  get window handles
    switch window  ${WindowHandles}[1]
    log  ${WindowHandles}
    sleep  1s

    open second browser
    click acceptterm
    download image
    switch window  ${WindowHandles}[0]
    log  ${WindowHandles}

    scroll and wait
    upload image
    sleep  2s
    verify image alert
    click submit button
    verify submit form message










