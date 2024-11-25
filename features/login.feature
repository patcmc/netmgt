Feature: User Login

  Background:
    Given a user exists with email "john.doe@example.com" and password "password123"

  Scenario: Successful login with valid credentials
    When the user logs in with email "john.doe@example.com" and password "password123"
    Then they should see the dashboard

  Scenario: Unsuccessful login with invalid credentials
    When the user logs in with email "john.doe@example.com" and password "wrongpassword"
    Then they should still be on the login page