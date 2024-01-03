*** Settings ***
Documentation    Create segmented one time email campaign
Metadata         ID                           636
Metadata         Automation priority          null
Metadata         Test case importance         Low
Resource         squash_resources.resource
Test Setup       Test Setup
Test Teardown    Test Teardown


*** Test Cases ***
Create segmented one time email campaign
    [Documentation]    Create segmented one time email campaign

    &{datatables} =    Retrieve Datatables

    Given Andy is already login as admin
    And When Andy want to create campaign "My Test Campaign" "${datatables}[datatable_1]"
    When Andy publish the campaign
    Then Campaign "My Test Campaign" is published


*** Keywords ***
Test Setup
    [Documentation]    test setup
    ...                You can define the ${TEST_SETUP} variable with a keyword for setting up all your tests.
    ...                You can define the ${TEST_636_SETUP} variable with a keyword for setting up this specific test.
    ...                If both are defined, ${TEST_636_SETUP} will be run after ${TEST_SETUP}.

    ${TEST_SETUP_VALUE} =        Get Variable Value    ${TEST_SETUP}
    ${TEST_636_SETUP_VALUE} =    Get Variable Value    ${TEST_636_SETUP}
    IF    $TEST_SETUP_VALUE is not None
        Run Keyword    ${TEST_SETUP}
    END
    IF    $TEST_636_SETUP_VALUE is not None
        Run Keyword    ${TEST_636_SETUP}
    END

Test Teardown
    [Documentation]    test teardown
    ...                You can define the ${TEST_TEARDOWN} variable with a keyword for tearing down all your tests.
    ...                You can define the ${TEST_636_TEARDOWN} variable with a keyword for tearing down this specific test.
    ...                If both are defined, ${TEST_TEARDOWN} will be run after ${TEST_636_TEARDOWN}.

    ${TEST_636_TEARDOWN_VALUE} =    Get Variable Value    ${TEST_636_TEARDOWN}
    ${TEST_TEARDOWN_VALUE} =        Get Variable Value    ${TEST_TEARDOWN}
    IF    $TEST_636_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_636_TEARDOWN}
    END
    IF    $TEST_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_TEARDOWN}
    END

Retrieve Datatables
    [Documentation]    Retrieves Squash TM's datatables and stores them in a dictionary.
    ...
    ...                For instance, 2 datatables have been defined in Squash TM,
    ...                the first one containing data:
    ...                | name | firstName |
    ...                | Bob  |   Smith   |
    ...                the second one containing data
    ...                | name  | firstName | age |
    ...                | Alice |   Smith   | 45  |
    ...
    ...                First, for each datatable, this keyword retrieves the values of each row
    ...                and stores them in a list, as follows:
    ...                @{row_1_1} =    Create List    name    firstName
    ...
    ...                Then, for each datatable, this keyword creates a list containing all the rows,
    ...                as lists themselves, as follows:
    ...                @{datatable_1} =    Create List    ${row_1_1}    ${row_1_2}
    ...
    ...                Finally, this keyword stores the datatables into the &{datatables} dictionary
    ...                with each datatable name as key, and each datatable list as value :
    ...                &{datatables} =    Create Dictionary    datatable_1=${datatable_1}    datatable_2=${datatable_2}

    @{row_1_1} =    Create List    Title               Segment     Campaign Type    Conversion Goal
    @{row_1_2} =    Create List    My Test Campaign    CXP Team    one time         payment
    @{datatable_1} =    Create List    ${row_1_1}    ${row_1_2}

    &{datatables} =    Create Dictionary    datatable_1=${datatable_1}

    RETURN    &{datatables}
