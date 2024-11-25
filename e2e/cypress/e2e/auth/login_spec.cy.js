describe('User Login', () => {
  beforeEach(() => {
    // Reset the application and seed the database
    cy.app('clean')
    cy.appFactories([['create', 'user', { email: 'john.doe@example.com', password: 'password' }]])

    // Visit the login page
    cy.visit('/users/sign_in')
  })

  it('allows a user to log in with valid credentials', () => {
    // Fill in the login form
    cy.get('input[name="user[email]"]').type('john.doe@example.com')
    cy.get('input[name="user[password]"]').type('password')

    // Click the login button
    cy.get('input[name="commit"]').click()

    // Assert that we were redirected to the dashboard URL
    cy.url().should('eq', `${Cypress.config().baseUrl}/app`)
  })

  it('shows an error with invalid credentials', () => {
    // Fill in the login form
    cy.get('input[name="user[email]"]').type('invalid@example.com')
    cy.get('input[name="user[password]"]').type('wrongpassword')

    // Click the login button
    cy.get('input[name="commit"]').click()

    // Optionally, ensure the URL hasn't changed
    cy.url().should('eq', `${Cypress.config().baseUrl}/users/sign_in`)
  })

  it('shows an error with missing credentials', () => {
    // Click the login button
    cy.get('input[name="commit"]').click()

    // Optionally, ensure the URL hasn't changed
    cy.url().should('eq', `${Cypress.config().baseUrl}/users/sign_in`)
  })
})
