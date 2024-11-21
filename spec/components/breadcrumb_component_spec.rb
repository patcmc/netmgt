# frozen_string_literal: true

require "rails_helper"

RSpec.describe(BreadcrumbComponent, type: :component) do
  let(:kwargs) do
    {
      links: [
        { name: "Home", path: "/" },
        { name: "Library", path: "/library" },
        { name: "Data", path: nil },
      ],
    }
  end

  describe "rendered component" do
    it { is_expected.to(have_css("nav[aria-label='Breadcrumb']")) }
  end

  describe "#initialize" do
    subject { component_instance }

    it { is_expected.to(be_an_instance_of(described_class)) }
    it { is_expected.to(have_attributes(links: kwargs[:links])) }
  end
end
