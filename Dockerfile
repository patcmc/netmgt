FROM ruby:3.3.0

# Set working directory
WORKDIR /app

# Install dependencies
RUN apt-get update -qq && \
    curl -fsSL https://deb.nodesource.com/setup_23.x | bash - && \
    apt-get install -y nodejs && \
    npm install --global yarn

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Copy package.json and yarn.lock
COPY package.json yarn.lock ./

# Install gems and node modules
RUN bundle install && yarn install

# Copy the rest of the application code
COPY . .

# Precompile assets (optional, for production)
# RUN bundle exec rake assets:precompile

# Expose port 3000
EXPOSE 3000

# Start the Rails server
CMD ["bin/dev"]
