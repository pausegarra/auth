(function () {
  function createToggleButton(input) {
    var button = document.createElement("button");
    button.type = "button";
    button.className = "password-toggle";
    button.setAttribute("aria-label", "Mostrar contrasena");
    button.setAttribute("aria-pressed", "false");
    button.innerHTML =
      '<svg class="password-toggle-icon eye-open" viewBox="0 0 24 24" aria-hidden="true" focusable="false">' +
      '<path d="M12 5C7 5 2.73 8.11 1 12c1.73 3.89 6 7 11 7s9.27-3.11 11-7c-1.73-3.89-6-7-11-7Zm0 11a4 4 0 1 1 0-8 4 4 0 0 1 0 8Z"></path>' +
      '<circle cx="12" cy="12" r="2.5"></circle>' +
      "</svg>" +
      '<svg class="password-toggle-icon eye-closed" viewBox="0 0 24 24" aria-hidden="true" focusable="false">' +
      '<path d="m3.28 2.22-1.06 1.06 3.02 3.02C3.53 7.59 2.08 9.62 1 12c1.73 3.89 6 7 11 7 2.12 0 4.11-.56 5.85-1.53l2.93 2.93 1.06-1.06L3.28 2.22Zm8.72 14.28c-2.49 0-4.5-2.01-4.5-4.5 0-.53.09-1.03.26-1.5l5.74 5.74c-.47.17-.97.26-1.5.26Zm0-9c2.49 0 4.5 2.01 4.5 4.5 0 .62-.13 1.21-.37 1.74l2.01 2.01c1.34-.99 2.46-2.32 3.24-3.75-1.73-3.89-6-7-11-7-1.45 0-2.84.26-4.12.74l1.86 1.86A4.47 4.47 0 0 1 12 7.5Z"></path>' +
      "</svg>";

    button.addEventListener("click", function () {
      var isVisible = input.type === "text";
      input.type = isVisible ? "password" : "text";
      button.setAttribute("aria-pressed", String(!isVisible));
      button.setAttribute(
        "aria-label",
        isVisible ? "Mostrar contrasena" : "Ocultar contrasena"
      );
      button.classList.toggle("is-visible", !isVisible);
    });

    return button;
  }

  function setupPasswordToggle(input) {
    if (!input || input.dataset.passwordToggleApplied === "true") {
      return;
    }

    var wrapper = document.createElement("div");
    wrapper.className = "password-field";
    input.parentNode.insertBefore(wrapper, input);
    wrapper.appendChild(input);
    wrapper.appendChild(createToggleButton(input));
    input.dataset.passwordToggleApplied = "true";
  }

  document.addEventListener("DOMContentLoaded", function () {
    var inputs = document.querySelectorAll('input[type="password"]');
    for (var i = 0; i < inputs.length; i += 1) {
      setupPasswordToggle(inputs[i]);
    }
  });
})();
