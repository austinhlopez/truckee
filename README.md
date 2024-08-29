# truckee
There's nothing better than a california burrito, bao or pizza from your favorite food truck.

Truckee is a Bay Area techie's dream: tasty and data-driven.

I'm a big fan of Tacos Mi Rancho out in Oakland, if you're up for the BART trip.

# Why Truckee? Why Now?

Restaurants have a famously high failure rate compared to other kinds of businesses. Most people with a dream of
starting a food truck want to bring their passion for cooking to people. On the way they're facing a lot of obstacles 
to achieving that dream--permitting, health inspections, sourcing food, presenting menu options, finding a location.

Everyone can find their closest, favorite food truck. Early-stage food trucks face tough competition. They need to find
special ways to attract customers.

Truckee is here to give a leg up on newcomers. We use data-driven analytics in order to identify the ideal site
for your food truck. You can opt to build a niche--starting a new food truck in a new culinary subcategory in
a popular spot or venturing early in an up-and-coming territory.

Then once you've chosen a site we manage the permitting lifecycle for you, connecting you with a cohort of up-and-coming food trucks around town for a foodie-focused coupon circuit.

Finally, and most importantly, we get you in with the events managers for venues and outdoor shows downtown for cheap.

# Contributing

Truckee's development team wants to prioritize a unified meetingplace to make product and technical decisions.

Please register a meeting time on our calendly and we'll get you plugged in:

*Zoom Link Here*

Once we've gotten in touch you'll be ready to start making commits.

# Read first: Roadmap, Decision Record, Style Guide, Bug List

If you'd like to make a contribution to any of these documents, get in touch.

*Product Roadmap Here*

*Decision Record Here*

*Coding Guide Here*

*Style Guide Here*

*Bug List Here*

# Setting Up Your Development Environment

Before you begin, ensure you have the following installed on your system:

- [Elixir](https://elixir-lang.org/install.html)
- [Erlang/OTP](https://www.erlang.org/downloads)
- [PostgreSQL](https://www.postgresql.org/download/)
- [PostGIS](https://postgis.net/)

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

3. **Set up the database and populate**:

    Make sure your database is configured correctly in `config/dev.exs`.

    ```bash
    mix ecto.create
    mix ecto.migrate
    mix run priv/repo/seeds.exs
    ```

## Running the Application

To start the Phoenix server, run the following command:

    bash
    mix phx.server

The app's homepage is available at ```localhost:4000```

## Pushing Code
We welcome contributions to this Elixir application! If you'd like to contribute, please follow these steps:

1. **Fork the repository** and clone it locally.
2. **Create a new branch** for your feature or bug fix:
   ```bash
   git checkout -b your-feature-branch
   ```
3. Label your branch "timestamp/category/description"
4. Run 'mix coveralls' and ensure that your pull request is increasing the test coverage of the codebase overall.
5. Expect a request for changes, an approval, or a request to discuss in person witihin 36 hours.
