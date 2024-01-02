*** Settings ***
Documentation    Login with unregistered credentials
Metadata         ID                           634
Metadata         Automation priority          null
Metadata         Test case importance         Low
Resource         squash_resources.resource
Test Setup       Test Setup
Test Teardown    Test Teardown


*** Test Cases ***
Login with unregistered credentials
    [Documentation]    Login with unregistered credentials

    Given Clara is on login page
    When Clara is login using unregistered username
    Then Clara cannot login
    And Message "Incorrect email-password combination" is appeared


*** Keywords ***
Test Setup
    [Documentation]    test setup
    ...                You can define the ${TEST_SETUP} variable with a keyword for setting up all your tests.
    ...                You can define the ${TEST_634_SETUP} variable with a keyword for setting up this specific test.
    ...                If both are defined, ${TEST_634_SETUP} will be run after ${TEST_SETUP}.

    ${TEST_SETUP_VALUE} =        Get Variable Value    ${TEST_SETUP}
    ${TEST_634_SETUP_VALUE} =    Get Variable Value    ${TEST_634_SETUP}
    IF    $TEST_SETUP_VALUE is not None
        Run Keyword    ${TEST_SETUP}
    END
    IF    $TEST_634_SETUP_VALUE is not None
        Run Keyword    ${TEST_634_SETUP}
    END

Test Teardown
    [Documentation]    test teardown
    ...                You can define the ${TEST_TEARDOWN} variable with a keyword for tearing down all your tests.
    ...                You can define the ${TEST_634_TEARDOWN} variable with a keyword for tearing down this specific test.
    ...                If both are defined, ${TEST_TEARDOWN} will be run after ${TEST_634_TEARDOWN}.

    ${TEST_634_TEARDOWN_VALUE} =    Get Variable Value    ${TEST_634_TEARDOWN}
    ${TEST_TEARDOWN_VALUE} =        Get Variable Value    ${TEST_TEARDOWN}
    IF    $TEST_634_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_634_TEARDOWN}
    END
    IF    $TEST_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_TEARDOWN}
    END
