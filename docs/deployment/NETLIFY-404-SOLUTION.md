# Netlify Deployment and 404 Page Solution

## Problem Solved

This solution addresses two main issues:

1. **Netlify 404 errors** when navigating to routes other than root (e.g., `/contact`)
2. **Missing custom 404 page** with brand-appropriate design

## Solution Components

### 1. Netlify SPA Routing Configuration

**Files modified:**

- `netlify.toml` - Contains the main redirect configuration
- `src/Frontend/wwwroot/_redirects` - Netlify-specific redirect file

**Configuration:**

```toml
# In netlify.toml
[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
```

```text
# In _redirects file
/*    /index.html   200
```

This configuration tells Netlify to serve `index.html` for all routes, allowing Blazor's client-side routing to handle navigation.

### 2. Custom 404 Page

**Files created/modified:**

- `src/Frontend/Pages/NotFound.razor` - Custom 404 page component
- `src/Frontend/wwwroot/css/app.css` - Styles for the 404 page
- `src/Frontend/App.razor` - Updated to use custom NotFound component
- `src/Frontend/_Imports.razor` - Added Pages namespace import

**Features of the 404 page:**

- **Brand-consistent design** following Urso brand guidelines
- **Animated bear illustration** with floating animation and pulsing code brackets
- **Friendly, Norwegian text** matching the target audience
- **Action buttons** to navigate to key pages (Home, Contact)
- **Helpful links** to other important pages
- **Responsive design** that works on mobile, tablet, and desktop
- **Subtle background patterns** with animated elements

### 3. Design Features

The 404 page includes:

- **Urso brand colors**: Deep blue (#1F3B4D), Bear brown (#6F4E37), etc.
- **Typography**: Montserrat for headings, Inter for body text
- **Animations**:
  - Floating bear illustration
  - Pulsing code brackets (`< />`)
  - Twinkling background dots
  - Sliding background lines
- **Interactive elements**:
  - Hover effects on buttons and links
  - Transform animations on button hover
  - Progressive enhancement for better UX

## How It Works

### For Netlify Deployment

1. When a user visits any URL (e.g., `yoursite.com/contact`)
2. Netlify checks if the file exists
3. If not found, the redirect rule triggers
4. Netlify serves `index.html` with a 200 status code
5. Blazor's router takes over and handles the client-side routing
6. If Blazor can't find a matching route, it displays the custom 404 page

### For Local Development

1. Blazor's development server handles routing directly
2. Unknown routes automatically trigger the `<NotFound>` component
3. The custom `NotFound.razor` component is displayed

## File Structure

```text
src/Frontend/
├── Pages/
│   └── NotFound.razor          # Custom 404 page component
├── wwwroot/
│   ├── _redirects              # Netlify redirect file
│   └── css/
│       └── app.css             # Contains 404 page styles
├── App.razor                   # Updated router configuration
└── _Imports.razor              # Added Pages namespace

netlify.toml                    # Netlify configuration
```

## Testing

### Local Testing

1. Run `dotnet run --project src/Frontend`
2. Navigate to `http://localhost:5167/nonexistent-page`
3. Verify the custom 404 page displays

### Production Testing on Netlify

1. Deploy to Netlify
2. Navigate to any non-existent route on your domain
3. Verify the custom 404 page displays instead of Netlify's default 404

## Key Benefits

1. **SEO-friendly**: Returns proper HTTP status codes
2. **User-friendly**: Custom branded 404 page instead of generic error
3. **SPA-compatible**: Allows client-side routing to work properly
4. **Performance**: Avoids unnecessary redirects for valid routes
5. **Maintainable**: Centralized configuration in standard files

## Troubleshooting

### If routes still return 404

1. Verify `_redirects` file is in the published `wwwroot` folder
2. Check Netlify deploy logs for redirect rule processing
3. Ensure the publish command includes the `_redirects` file
4. Verify netlify.toml is in the repository root

### If custom 404 page doesn't show

1. Check that `NotFound.razor` component compiles without errors
2. Verify the `App.razor` router configuration
3. Ensure the Pages namespace is imported in `_Imports.razor`
4. Check browser console for JavaScript errors

## Commands for Deployment

```bash
# Build and publish for Netlify
dotnet publish src/Frontend -c Release -o dist --nologo

# The publish folder 'dist/wwwroot' contains:
# - index.html
# - _redirects file
# - All static assets
# - Blazor WebAssembly files
```

This solution provides a complete, professional handling of routing and
404 errors for the Urso Blazor WebAssembly application on Netlify.
