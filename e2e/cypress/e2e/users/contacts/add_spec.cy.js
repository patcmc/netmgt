describe('Add Contact', () => {
  before(() => {
    // Reset the application and seed the database
    cy.app('clean')

    cy.fixture('users/list.json').then((users) => {
      cy.appFactories([['create', 'user', users.john_doe]])
      cy.clearCookies()
      cy.clearLocalStorage()
      cy.login(users.john_doe.email, users.john_doe.password)
    })
  })

  beforeEach(() => {
    cy.visit('/app/contacts')
  })

  it('allows a user to create a contact with valid data', () => {
    cy.fixture('user_contacts/new.json').then((contact) => {
      cy.get('[data-cy="add-contact-button"]').should('be.visible').click()

      cy.get('[data-cy="add-contact-modal"]').should('be.visible')

      cy.get('input[name="user_contact[name]"]').type(contact.valid.name)
      cy.get('input[name="user_contact[email]"]').type(contact.valid.email)
      cy.get('input[name="user_contact[phone]"]').type(contact.valid.phone)
      cy.get('select[name="user_contact[tags]"]').select(contact.valid.tags)

      cy.get('input[name="commit"]').should('be.enabled').click()

      cy.get('[data-cy="add-contact-modal"]').should('not.be.visible')

      cy.contains(contact.valid.name).should('be.visible')
    })
  })
})
