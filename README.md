# truckee
Find your Favorite Food Truck!

There's nothing better than a california burrito on a cool night.

Truckee is a San Fran techie's dream: tasty and data-driven.

My personal favorite is Tacos Mi Rancho out in Oakland, but if

you're not trying to take the BART we're here to help.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- [Elixir](https://elixir-lang.org/install.html)
- [Erlang/OTP](https://www.erlang.org/downloads)
- [PostgreSQL](https://www.postgresql.org/download/) (or any other preferred database)

## Initial Setup

1. **Clone the repository** (if using version control):

    ```bash
    git clone https://github.com/austinhlopez/truckee.git
    cd truckee
    ```

2. **Install Elixir dependencies**:

    ```bash
    mix deps.get
    ```

3. **Set up the database**:

    Make sure your database is configured correctly in `config/dev.exs`.

    ```bash
    mix ecto.create
    mix ecto.migrate
    ```

## Running the Application

To start the Phoenix server, run the following command:

```bash
mix phx.server
