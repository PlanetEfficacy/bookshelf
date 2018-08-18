require "administrate/base_dashboard"

class AuthorDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    books: Field::HasMany.with_options(
      sort_by: 'published',
      direction: :desc
    ),
    id: Field::Number,
    first_name: Field::String,
    last_name: Field::String,
    date_of_birth: Field::DateTime.with_options(
      format: '%F'
    ),
    created_at: Field::DateTime.with_options(
      format: '%F %R'
    ),
    updated_at: Field::DateTime.with_options(
      format: '%F %R'
    ),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :first_name,
    :last_name,
    :books,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :first_name,
    :last_name,
    :date_of_birth,
    :created_at,
    :updated_at,
    :books,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :first_name,
    :last_name,
    :date_of_birth,
  ].freeze

  # Overwrite this method to customize how authors are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(author)
    "#{author.display_name}"
  end
end
