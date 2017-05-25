Feature: Login

 @manual
 Scenario: As a Recap user,I can view error message without enter username, password & Institution
   Given I launch the SCSB application
    When I click submit button
    Then I should see following error messages:
	 |messages              |
	 |This Field is required|


  @manual
 Scenario: As a Recap user,I can view error message when I enter invalid credentials
   Given I launch the SCSB application
    When I enter invalid credentials
     And I select Institution
     And I click submit button
	  Then I should see the error message Invalid Credentials

  @manual
 Scenario: As a Recap user,I can login with valid credentials
   Given I launch the SCSB application
    When I enter valid credentials
     And I select Institution
     And I click submit button
	  Then I should navigate to search page

  @manual
 Scenario: As a Recap user,I can logout with successful login
   Given I launch the SCSB application
    When I enter valid credentials
     And I select Institution
     And I click submit button
	  Then I should navigate to search page 
	  When I click logout 
	  Then I should navigate login page

  @automation
 Scenario: As a user,I can view Recap tweet timeline in login page
   Given I launch the SCSB application
    Then I should see Recap tweet timeline in login page

 @automation
 Scenario Outline: As a user,I can view Institutions symbols on login page and navigate to corresponding Institution webpages
   Given I launch the SCSB application
	Then I should navigate login page
	 And I click Institutions "<symbols>" on login page:
	Then I should navigate to corresponding "<Institution_webpage>"

	Examples:
     |symbols|Institution_webpage           |
     #|Recap  |http://recap.princeton.edu/  |
     |CUL    |http://www.columbia.edu/      |
     |PUL    |https://www.princeton.edu/    |
     |NYPL   |https://www.nypl.org/         |

  @automation
  Scenario Outline: As a user,I can navigate when I clicking Recap links on login page
   Given I launch the SCSB application
	Then I should navigate login page
	 And I click Recap "<links>" on login page:
	Then I should navigate to corresponding "<webpage>"

	Examples:
     |links                      |webpage                                             |
     #|AboutRecap                 |https://recap.princeton.edu/                       |
     |Facility & Storage         |https://recap.princeton.edu/facility-storage        |
     |Operations & Statistics    |https://recap.princeton.edu/operations-statistics   |
     |Collections & Services     |https://recap.princeton.edu/collections-services    |
     |Information & Publications |https://recap.princeton.edu/information-publications|
