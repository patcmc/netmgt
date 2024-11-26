describe('User Login', () => {
  beforeEach(() => {
    cy.app('clean')
    cy.appFactories([['create', 'user', { email: 'john.doe@example.com', password: 'password' }]])

    cy.visit('/users/sign_in')
  })

  it('allows a user to log in with valid credentials', () => {
    cy.get('input[name="user[email]"]').type('john.doe@example.com')
    cy.get('input[name="user[password]"]').type('password')
    cy.get('form').submit()

    cy.url().should('eq', `${Cypress.config().baseUrl}/app`)
  })

  it('shows an error with invalid credentials', () => {
    cy.get('input[name="user[email]"]').type('invalid@example.com')
    cy.get('input[name="user[password]"]').type('wrongpassword')
    cy.get('form').submit()

    cy.url().should('eq', `${Cypress.config().baseUrl}/users/sign_in`)
  })

  it('shows an error with missing credentials', () => {
    cy.get('form').submit()

    cy.url().should('eq', `${Cypress.config().baseUrl}/users/sign_in`)
  })
})
