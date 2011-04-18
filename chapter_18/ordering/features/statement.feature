#language:en
Feature: Generating statement
  In order to show customers their order
  As a online bookstore owner
  I want customers to see their statements on the web

  Scenario Outline:
    Given a discount of <discount>
    When I order the following book:
      | title                          | price   |
      | Healthy eating for programmers | <price> |
    Then the statement should read: "Statement total is: <total>"
    Scenarios:
      | discount | price  | total  |
      | 10%      | $29.99 | $26.99 |
      | 15%      | $29.99 | $25.49 |
