# EZFlix – Movie & Series Distribution System

EZFlix is a digital platform for the distribution of movies and series, allowing users to **purchase** or **rent** audiovisual content through a structured, secure, and scalable system.

The system supports personalized user libraries, secure transactions, role-based access, legal content management, and automated revenue tracking, replicating the core functionalities of a commercial digital streaming service.

## Business Model Overview

EZFlix enables:

- Permanent **purchases** of movies and series added to the user's library.
- Time-limited **rentals** with access restrictions.
- Individual episode management for series.
- Role-based **access control** for administrative functions.
- Tracking of **financial transactions**, including payment methods and revenue.
- Management of **content distribution rights** and legal requirements through dedicated entities.
- Full **traceability** through operational logs and audit mechanisms.
- Automation of critical actions such as income registration and integrity validation.

The business model is supported by a modular and normalized data schema, ensuring maintainability and extensibility.


## Database Structure

The physical data model is composed of the following main components:

### Users & Roles
- **Users**: Stores personal and contact information.
- **Accounts**: Handles authentication and user credentials.
- **SystemActors**: Assigns roles to accounts for access control and permissions.

### Content Management
- **Movies**: Metadata and classification for individual films.
- **Series**: High-level data structure for serialized content.
- **Episodes**: Linked to their respective series with attributes such as duration and release order.
- **Distributors**: Entities responsible for content licensing and partnerships.
- **ContentControllers**: Represent editorial or legal responsibilities tied to each content unit.

### User Libraries
- **Libraries**: Each user is linked to a personalized library.
- **LibraryMovies / LibrarySeries**: Associative tables for storing purchased or rented items per user.

### Transactions & Revenue
- **Operations**: Logs all user transactions, including purchases and rentals.
- **Purchases / Rentals**: Separate transaction types with specific constraints and triggers.
- **PaymentMethods**: Stores and validates payment instruments linked to operations.
- **Revenue**: View that automates revenue calculation for financial monitoring.
- **Audit**: Operational logs for monitoring and accountability.


## Modules

### Persistence

- Core tables for movies, series, users, accounts, libraries, and transactions.
- Constraints on data types, nullability, and foreign key relations.
- Unique constraints and primary keys to ensure integrity.
- Referential scripts (`xTables`) to drop the entire schema if needed.
- SQL queries for referential checks and integrity tests.

### Testing

- `PopulateOK`: Inserts valid and coherent data entries.
- `PopulateNotOK`: Inserts invalid data to test constraints.
- `xPopulate`: Cleans up data for testing cycles.

### Constraints & Automation

- Multi-attribute validations across entities.
- Triggers for automatic behavior, such as income generation or content access.
- Referential actions (cascade, restrict) on update/delete.
- Trigger removal scripts (`xTriggers`).

### Indexes & Views

- Indexes on commonly queried fields to optimize performance.
- Views for simplified reporting and income calculations.
- Scripts for cleaning views and indexes (`xIndexesViews`).

### CRUD Components

- `CRUDE`: Declarative component interfaces (Create, Read, Update, Delete).
- `CRUDI`: Implementations of the above components.
- `xCRUD`: Cleanup scripts for component removal.

### Security

- Role definition and user-role associations.
- Permissions granted and revoked per role.
- Scripts to deploy and remove security settings (`Security`, `xSecurity`).
- `SecurityOK`: Tests access control for different user roles.


## Final Testing

Includes complete functional stories submitted by team members to validate business logic from the user perspective.


## Notes

EZFlix’s database design is modular, secure, and aligned with the core needs of a real-world digital distribution platform. It facilitates seamless user experiences, content acquisition, legal compliance, and administrative oversight. Each component is built to reflect the operational demands of a professional streaming service, allowing further scalability and integration with future development cycles.

## Built With
* [SQL Developer](https://www.oracle.com/database/sqldeveloper/)
* [Astah Community Edition](https://astah.net/)

## Authors
* **Santiago Botero** - [LePeanutButter](https://github.com/LePeanutButter)
* **Jacobo Diaz** - [Jacob202122](https://github.com/Jacob202122)