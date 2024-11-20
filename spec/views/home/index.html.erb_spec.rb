# frozen_string_literal: true

# rubocop:disable Layout/ArgumentAlignment

require "rails_helper"

RSpec.describe("home/index.html.erb", type: :view) do
  # Initialize a Capybara node for the rendered view
  let(:page) { Capybara.string(rendered) }

  before do
    render
  end

  # 1. Welcome Section
  describe "Welcome Section" do
    it "displays the main welcome message" do
      expect(page).to(have_css("h1.text-6xl.font-bold.mb-8", text: "Welcome to NetMgt!"))
    end

    it "includes the features list with correct items" do
      expect(page).to(have_css("ul.text-lg.mb-6.space-y-4")) do |ul|
        expect(ul).to(have_content("Manage and monitor your network devices in real-time."))
        expect(ul).to(have_content("Advanced features like device management and real-time monitoring."))
        expect(ul).to(have_content("Ensure optimal performance with security alerts."))
      end
    end

    it "contains the descriptive paragraph" do
      # Use a regex to account for line breaks and varying whitespace
      expect(page).to(have_text(/Join thousands of satisfied users who have transformed their network\s+management with NetMgt\./))
    end

    it "includes the 'Get Started' button with correct classes and text" do
      expect(page).to(have_css(
        'button.bg-white.text-primary.hover\\:bg-secondary.px-8.py-3.rounded-full.text-lg.font-semibold.shadow.transition.duration-300.ease-in-out', text: "Get Started"
      ))
    end
  end

  # 2. Features Section
  describe "Features Section" do
    it "renders the Features section container" do
      expect(page).to(have_css('div.container.mx-auto.px-4.sm\\:px-8.py-12.mb-12'))
    end

    it "displays three feature cards with correct titles and descriptions" do
      expect(page).to(have_css('div.grid.grid-cols-1.md\\:grid-cols-3.gap-8.text-center')) do |grid|
        feature_cards = grid.all("div.p-6.bg-white.rounded-lg.shadow")

        # Feature 1
        within(feature_cards[0]) do
          expect(page).to(have_css("h2.text-lg.font-semibold.text-gray-700", text: "Real-time Monitoring"))
          expect(page).to(have_css(
            "p.text-gray-600.mt-2",
text: "Monitor your network performance and get real-time updates on network health and traffic.",
          ))
        end

        # Feature 2
        within(feature_cards[1]) do
          expect(page).to(have_css("h2.text-lg.font-semibold.text-gray-700", text: "Device Management"))
          expect(page).to(have_css(
            "p.text-gray-600.mt-2",
text: "Manage all your network devices from a single dashboard with advanced configuration options.",
          ))
        end

        # Feature 3
        within(feature_cards[2]) do
          expect(page).to(have_css("h2.text-lg.font-semibold.text-gray-700", text: "Security Alerts"))
          expect(page).to(have_css(
            "p.text-gray-600.mt-2",
text: "Receive instant alerts for network vulnerabilities and threats, ensuring your network's security.",
          ))
        end
      end
    end
  end

  # 3. Testimonials Section
  describe "Testimonials Section" do
    it "renders the Testimonials section container" do
      expect(page).to(have_css("div.bg-gray-200.py-12.mb-12"))
    end

    it "includes the Testimonials header" do
      expect(page).to(have_css("h2.text-3xl.font-bold.text-center.text-gray-800", text: "What Our Users Say"))
    end

    it "displays three testimonials with correct quotes and authors" do
      expect(page).to(have_css('div.grid.grid-cols-1.md\\:grid-cols-3.gap-8.mt-6')) do |grid|
        testimonials = grid.all("div.bg-white.rounded-lg.shadow.p-6")

        # Testimonial 1
        within(testimonials[0]) do
          expect(page).to(have_css(
            "p.text-gray-600.italic",
text: '"NetMgt has simplified our network operations and increased our response times dramatically."',
          ))
          expect(page).to(have_css("div.mt-4.text-gray-700.font-semibold", text: "John Doe, Network Admin"))
        end

        # Testimonial 2
        within(testimonials[1]) do
          expect(page).to(have_css(
            "p.text-gray-600.italic",
text: '"Thanks to NetMgt, we now have a secure and reliable network system in place."',
          ))
          expect(page).to(have_css("div.mt-4.text-gray-700.font-semibold", text: "Jane Smith, IT Manager"))
        end

        # Testimonial 3
        within(testimonials[2]) do
          expect(page).to(have_css(
            "p.text-gray-600.italic",
text: '"The real-time monitoring tools are a game changer for our network health management."',
          ))
          expect(page).to(have_css("div.mt-4.text-gray-700.font-semibold", text: "Alice Johnson, System Engineer"))
        end
      end
    end
  end

  # 4. Overall Page Structure
  describe "Overall Page Structure" do
    it "has the correct background gradient for the Welcome section" do
      expect(page).to(have_css("div.min-h-screen.bg-gradient-to-r.from-primary.to-secondary.flex.items-center.justify-center.px-6"))
    end

    it "uses responsive design classes appropriately" do
      # Check for individual responsive classes separately to avoid brittle class order
      expect(page).to(have_css("div.container.mx-auto.px-4"))
      expect(page).to(have_css('div.sm\\:px-8'))
      expect(page).to(have_css("div.grid.grid-cols-1"))
      expect(page).to(have_css('div.md\\:grid-cols-3.gap-8'))
    end
  end
end

# rubocop:enable Layout/ArgumentAlignment
