# Use the official Ruby image as the base
FROM ruby:3.0.0

# Install dependencies
RUN apt-get update -qq && apt-get install -y curl

# Install Node.js (choose the version you need; here we're using 16.x)
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

# Install Yarn
RUN npm install --global yarn

# Set working directory
WORKDIR /app

RUN gem install bundler:2.5.22
RUN gem update --system

# Copy the Gemfile and Gemfile.lock into the working directory
COPY Gemfile Gemfile.lock ./
RUN bundle update ffi && bundle install

# Copy the rest of the application code
COPY . .

# Expose port 3000 to access Rails server
EXPOSE 3000

# Set environment variables
ENV RAILS_ENV=development
ENV RAILS_LOG_TO_STDOUT=true

# Run database setup
RUN bundle exec rails db:create db:migrate db:seed

# Precompile assets and start the server
CMD ["rails", "server", "-b", "0.0.0.0"]
