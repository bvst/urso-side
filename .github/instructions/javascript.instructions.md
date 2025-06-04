---
applyTo: '**/*.js, **/*.ts'
---
# JavaScript/TypeScript Instruksjoner for Urso

## Generelle Prinsipper
- Skriv moderne, ren JavaScript/TypeScript
- Bruk ES6+ funksjoner og syntax
- Prioriter lesbarhet og vedlikeholdbarhet
- Følg etablerte konvensjoner og beste praksis

## Navngivningskonvensjoner
- **Variabler og funksjoner**: camelCase (f.eks. `userName`, `calculateTotal`)
- **Konstanter**: UPPER_SNAKE_CASE (f.eks. `MAX_RETRIES`, `API_ENDPOINTS`)
- **Klasser**: PascalCase (f.eks. `UserManager`, `ApiClient`)
- **Filer**: kebab-case (f.eks. `user-service.js`, `api-client.ts`)

## Kodestruktur
```javascript
// Imports øverst
import { Component } from './component.js';

// Konstanter
const DEFAULT_TIMEOUT = 5000;

// Hovedfunksjonalitet
class UrsoComponent {
    constructor(options = {}) {
        this.options = { ...DEFAULT_OPTIONS, ...options };
        this.init();
    }

    init() {
        // Initialiseringslogikk
    }
}

// Export nederst
export default UrsoComponent;
```

## DOM Manipulasjon
- Bruk moderne DOM API-er (querySelector, addEventListener)
- Unngå jQuery hvis det ikke er nødvendig
- Implementer event delegation for dynamisk innhold
- Bruk DocumentFragment for batch DOM-oppdateringer

```javascript
// Godt eksempel
const toggleButton = document.querySelector('.nav-toggle');
const navMenu = document.querySelector('.nav-menu');

toggleButton?.addEventListener('click', () => {
    navMenu?.classList.toggle('active');
});
```

## Event Handling
- Bruk arrow functions for event listeners
- Implementer proper cleanup av event listeners
- Bruk passive listeners for scroll/touch events
- Debounce/throttle intensive events

```javascript
// Debounce eksempel
const debounce = (func, wait) => {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
};

const handleResize = debounce(() => {
    // Resize logic
}, 250);

window.addEventListener('resize', handleResize);
```

## Asynkron Programmering
- Bruk async/await fremfor Promise.then()
- Implementer proper feilhåndtering med try/catch
- Bruk Promise.all() for parallelle operasjoner
- Sett rimelige timeouts for nettverksforespørsler

```javascript
async function fetchUserData(userId) {
    try {
        const response = await fetch(`/api/users/${userId}`, {
            signal: AbortSignal.timeout(5000)
        });
        
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        
        return await response.json();
    } catch (error) {
        console.error('Failed to fetch user data:', error);
        throw error;
    }
}
```

## Performance Optimalisering
- Minimiser DOM-queries ved å cache selectors
- Bruk requestAnimationFrame for animasjoner
- Implementer lazy loading for bilder og komponenter
- Unngå memory leaks ved å fjerne event listeners

```javascript
// Intersection Observer for lazy loading
const imageObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            const img = entry.target;
            img.src = img.dataset.src;
            img.classList.remove('lazy');
            imageObserver.unobserve(img);
        }
    });
});

document.querySelectorAll('img[data-src]').forEach(img => {
    imageObserver.observe(img);
});
```

## Feilhåndtering
- Implementer global error handling
- Log feil med tilstrekkelig kontekst
- Gi brukervennlige feilmeldinger
- Implementer graceful degradation

```javascript
window.addEventListener('error', (event) => {
    console.error('Global error:', {
        message: event.message,
        filename: event.filename,
        lineno: event.lineno,
        colno: event.colno,
        error: event.error
    });
});

window.addEventListener('unhandledrejection', (event) => {
    console.error('Unhandled promise rejection:', event.reason);
});
```

## TypeScript Spesifikke Retningslinjer
- Bruk strikt TypeScript konfigurasjon
- Definer tydelige interfaces og types
- Unngå `any` type hvis mulig
- Bruk utility types for transformasjoner

```typescript
interface UrsoUser {
    readonly id: string;
    name: string;
    email: string;
    role: 'admin' | 'user' | 'guest';
    createdAt: Date;
}

type CreateUserRequest = Omit<UrsoUser, 'id' | 'createdAt'>;
type UpdateUserRequest = Partial<Pick<UrsoUser, 'name' | 'email'>>;
```

## Urso-Spesifikke Konvensjoner
- Bruk norske kommentarer for brukervendte funksjoner
- Implementer tilgjengelighetsfunksjoner (ARIA, keyboard navigation)
- Følg Urso designsystem for animasjoner og interaksjoner
- Prioriter progressive enhancement

```javascript
// Norske kommentarer for brukervendte funksjoner
function toggleNavigasjon() {
    // Veksler mellom åpen og lukket navigasjon
    const nav = document.querySelector('.hovednavigasjon');
    nav.classList.toggle('aktiv');
    
    // Oppdater ARIA attributter for tilgjengelighet
    const isOpen = nav.classList.contains('aktiv');
    nav.setAttribute('aria-expanded', isOpen.toString());
}
```

## Testing
- Skriv unit tests for viktige funksjoner
- Bruk Jest eller lignende testing framework
- Test både positive og negative scenarier
- Mock externe dependencies

```javascript
// Jest test eksempel
describe('UrsoUtils', () => {
    test('debounce should delay function execution', async () => {
        const mockFn = jest.fn();
        const debouncedFn = debounce(mockFn, 100);
        
        debouncedFn();
        debouncedFn();
        debouncedFn();
        
        expect(mockFn).not.toHaveBeenCalled();
        
        await new Promise(resolve => setTimeout(resolve, 150));
        expect(mockFn).toHaveBeenCalledTimes(1);
    });
});
```

## Dokumentasjon
- Bruk JSDoc for dokumentasjon av funksjoner
- Inkluder eksempler i dokumentasjonen
- Dokumenter komplekse algoritmer og business logic
- Hold dokumentasjon oppdatert med kodeendringer

```javascript
/**
 * Validerer en norsk telefonnummer
 * @param {string} phoneNumber - Telefonnummer som skal valideres
 * @returns {boolean} true hvis nummeret er gyldig
 * @example
 * validatePhoneNumber('+47 123 45 678'); // true
 * validatePhoneNumber('12345'); // false
 */
function validatePhoneNumber(phoneNumber) {
    const norwegianPhoneRegex = /^(\+47|0047|47)?[2-9]\d{7}$/;
    return norwegianPhoneRegex.test(phoneNumber.replace(/\s+/g, ''));
}
```
