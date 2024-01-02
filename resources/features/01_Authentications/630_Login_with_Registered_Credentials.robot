*** Settings ***
Documentation    Login with Registered Credentials
Metadata         ID                           630
Metadata         Automation priority          1
Metadata         Test case importance         High
Resource         squash_resources.resource
Library          squash_tf.TFParamService
Test Setup       Test Setup
Test Teardown    Test Teardown


*** Test Cases ***
Login with Registered Credentials
    [Documentation]    Login with Registered Credentials

    &{dataset} =    Retrieve Dataset

    Given Andy is on Login Page
    When Andy is login using registered email "${dataset}[REGISTERED_EMAIL]" and password "${dataset}[REGISTERED_PASSWORD]"
    Then Andy is on OTP page


*** Keywords ***
Test Setup
    [Documentation]    test setup
    ...                You can define the ${TEST_SETUP} variable with a keyword for setting up all your tests.
    ...                You can define the ${TEST_630_SETUP} variable with a keyword for setting up this specific test.
    ...                If both are defined, ${TEST_630_SETUP} will be run after ${TEST_SETUP}.

    ${TEST_SETUP_VALUE} =        Get Variable Value    ${TEST_SETUP}
    ${TEST_630_SETUP_VALUE} =    Get Variable Value    ${TEST_630_SETUP}
    IF    $TEST_SETUP_VALUE is not None
        Run Keyword    ${TEST_SETUP}
    END
    IF    $TEST_630_SETUP_VALUE is not None
        Run Keyword    ${TEST_630_SETUP}
    END

Test Teardown
    [Documentation]    test teardown
    ...                You can define the ${TEST_TEARDOWN} variable with a keyword for tearing down all your tests.
    ...                You can define the ${TEST_630_TEARDOWN} variable with a keyword for tearing down this specific test.
    ...                If both are defined, ${TEST_TEARDOWN} will be run after ${TEST_630_TEARDOWN}.

    ${TEST_630_TEARDOWN_VALUE} =    Get Variable Value    ${TEST_630_TEARDOWN}
    ${TEST_TEARDOWN_VALUE} =        Get Variable Value    ${TEST_TEARDOWN}
    IF    $TEST_630_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_630_TEARDOWN}
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

    ${REGISTERED_EMAIL} =       Get Test Param    DS_REGISTERED_EMAIL
    ${REGISTERED_PASSWORD} =    Get Test Param    DS_REGISTERED_PASSWORD

    &{dataset} =    Create Dictionary    REGISTERED_EMAIL=${REGISTERED_EMAIL}    REGISTERED_PASSWORD=${REGISTERED_PASSWORD}

    RETURN    &{dataset}
