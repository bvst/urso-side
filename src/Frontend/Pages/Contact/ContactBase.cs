using Microsoft.AspNetCore.Components;
using System.ComponentModel.DataAnnotations;

namespace Frontend.Pages.Contact;

public class ContactBase : ComponentBase
{
    protected ContactFormModel contactForm = new();
    protected bool isSubmitting = false;
    protected string submitMessage = "";
    protected bool submitSuccess = false;
    protected Dictionary<string, string> validationErrors = new();

    protected async Task HandleSubmit()
    {
        // Clear previous errors
        validationErrors.Clear();
        isSubmitting = true;
        submitMessage = "";

        // Basic validation
        if (string.IsNullOrWhiteSpace(contactForm.Name))
            validationErrors["Name"] = "Navn er påkrevd";

        if (string.IsNullOrWhiteSpace(contactForm.Email))
            validationErrors["Email"] = "E-post er påkrevd";
        else if (!IsValidEmail(contactForm.Email))
            validationErrors["Email"] = "Ugyldig e-postadresse";

        if (string.IsNullOrWhiteSpace(contactForm.Message))
            validationErrors["Message"] = "Prosjektbeskrivelse er påkrevd";

        if (validationErrors.Any())
        {
            isSubmitting = false;
            submitMessage = "Vennligst rett opp feilene og prøv igjen.";
            submitSuccess = false;
            StateHasChanged();
            return;
        }

        try
        {
            // Simulate form submission
            await Task.Delay(1500);

            // Here you would typically send the form to your backend API
            // For now, we'll just simulate success
            submitSuccess = true;
            submitMessage = "Takk for din henvendelse! Vi setter stor pris på at du tok kontakt. Vi kommer tilbake til deg innen 24 timer med et svar tilpasset dine behov.";
            contactForm = new(); // Reset form
        }
        catch (Exception)
        {
            submitSuccess = false;
            submitMessage = "Beklager, det oppstod en teknisk feil. Vennligst prøv igjen eller send oss en e-post direkte til kontakt@urso.no.";
        }
        finally
        {
            isSubmitting = false;
            StateHasChanged();
        }
    }

    private bool IsValidEmail(string email)
    {
        try
        {
            var addr = new System.Net.Mail.MailAddress(email);
            return addr.Address == email;
        }
        catch
        {
            return false;
        }
    }

    protected string GetFieldClass(string fieldName)
    {
        return validationErrors.ContainsKey(fieldName) ? "form-input error" : "form-input";
    }

    protected string? GetFieldError(string fieldName)
    {
        return validationErrors.TryGetValue(fieldName, out var error) ? error : null;
    }
}
