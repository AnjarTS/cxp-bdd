*** Settings ***
Documentation    Enter invalid OTP after login with registered credentials
Metadata         ID                           633
Metadata         Automation priority          null
Metadata         Test case importance         High
Resource         squash_resources.resource
Library          squash_tf.TFParamService
Test Setup       Test Setup
Test Teardown    Test Teardown


*** Test Cases ***
Enter invalid OTP after login with registered credentials
    [Documentation]    Enter invalid OTP after login with registered credentials

    &{dataset} =    Retrieve Dataset

    Given Andy already login
    And Andy is on OTP page
    When Andy enter wrong OTP "${dataset}[OTP]"
    Then Andy is unable to login


*** Keywords ***
Test Setup
    [Documentation]    test setup
    ...                You can define the ${TEST_SETUP} variable with a keyword for setting up all your tests.
    ...                You can define the ${TEST_633_SETUP} variable with a keyword for setting up this specific test.
    ...                If both are defined, ${TEST_633_SETUP} will be run after ${TEST_SETUP}.

    ${TEST_SETUP_VALUE} =        Get Variable Value    ${TEST_SETUP}
    ${TEST_633_SETUP_VALUE} =    Get Variable Value    ${TEST_633_SETUP}
    IF    $TEST_SETUP_VALUE is not None
        Run Keyword    ${TEST_SETUP}
    END
    IF    $TEST_633_SETUP_VALUE is not None
        Run Keyword    ${TEST_633_SETUP}
    END

Test Teardown
    [Documentation]    test teardown
    ...                You can define the ${TEST_TEARDOWN} variable with a keyword for tearing down all your tests.
    ...                You can define the ${TEST_633_TEARDOWN} variable with a keyword for tearing down this specific test.
    ...                If both are defined, ${TEST_TEARDOWN} will be run after ${TEST_633_TEARDOWN}.

    ${TEST_633_TEARDOWN_VALUE} =    Get Variable Value    ${TEST_633_TEARDOWN}
    ${TEST_TEARDOWN_VALUE} =        Get Variable Value    ${TEST_TEARDOWN}
    IF    $TEST_633_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_633_TEARDOWN}
    END
    IF    $TEST_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_TEARDOWN}
    END

Retrieve Dataset
    [Documentation]    Retrieves Squash TM's datasets and stores them in a dictionary.
    ...
    ...                For instance, datasets containing 3 parameters "city", "country" and "currency"
    ...                have been defined in Squash TM.
    ...
    ...                First, this keyword retrieves parameter values from Squash TM
    ...                and stores them into variables, using the keyword 'Get Test Param':
    ...                ${city} =    Get Test Param    DS_city
    ...
    ...                Then, this keyword stores the parameters into the &{dataset} dictionary
    ...                with each parameter name as key, and each parameter value as value:
    ...                &{dataset} =    Create Dictionary    city=${city}    country=${country}    currency=${currency}

    ${OTP} =    Get Test Param    DS_OTP

    &{dataset} =    Create Dictionary    OTP=${OTP}

    RETURN    &{dataset}
