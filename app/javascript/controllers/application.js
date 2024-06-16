import { Application } from "@hotwired/stimulus";
import { Turbo } from "@hotwired/turbo-rails";

const application = Application.start();

// Configure Stimulus development experience
application.debug = true;
window.Stimulus = application;

export { application };

Turbo.setProgressBarDelay = 0;
