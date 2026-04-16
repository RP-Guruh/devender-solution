class ProjectsController < ApplicationController
  def show
    @project_id = params[:id]
    
    # Dummy data for projects based on the agency context
    projects = {
      "ratu-madani" => {
        title: "Ratu Madani Tour Organizer",
        tag: "Travel & CMS",
        description: "A comprehensive booking system and agency website for one of Depok's leading tour organizers. We built a full custom CMS to manage tour packages, bookings, and customer profiles.",
        logo: "LOGO_BG_PUTIH-removebg-preview.png",
        color: "#00C8E8",
        results: ["200% Increase in Online Bookings", "40% Faster Load Times", "Seamless Admin Control"],
        features: ["Custom Tour CMS", "WhatsApp Integration", "Mobile-first Design"]
      },
      "luxe-store" => {
        title: "Luxe Store Redesign",
        tag: "E-Commerce",
        description: "Transforming a traditional retail brand into a digital-first high-end fashion destination.",
        logo: nil,
        color: "#1a3a4a"
      }
    }

    @project = projects[@project_id] || projects.values.first
  end
end
