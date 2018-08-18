require "administrate/base_dashboard"

class BookDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    author: Field::BelongsTo.with_options(
      searchable: true,
      searchable_field: 'last_name'
    ),
    genre: Field::BelongsTo.with_options(
      searchable: true,
      searchable_field: 'name'
    ),
    reviews: Field::HasMany,
    user: Field::BelongsTo,
    id: Field::Number,
    title: Field::Text.with_options(
      searchable: true,
    ),
    published: Field::DateTime.with_options(
      format: '%F',
    ),
    hours: Field::Number,
    pages: Field::Number,
    amazon_url: Field::String,
    audible_url: Field::String,
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
    :title,
    :published,
    :author,
    :genre,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :author,
    :genre,
    :id,
    :title,
    :published,
    :hours,
    :pages,
    :amazon_url,
    :audible_url,
    :created_at,
    :updated_at,
    :reviews,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :author,
    :genre,
    :title,
    :published,
    :hours,
    :pages,
    :amazon_url,
    :audible_url,
  ].freeze

  # Overwrite this method to customize how books are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(book)
    "#{book.title}"
  end
end
