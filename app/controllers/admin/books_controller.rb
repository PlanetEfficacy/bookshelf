module Admin
  class BooksController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Book.
    #     page(params[:page]).
    #     per(10)
    # end

    def create
      @book = Book.new(book_params)
      respond_to do |format|
        if @book.save
          # flash[:notice] = 'Book was successfully created.'
          format.html { redirect_to admin_book_path(@book) }
        else
          flash[:error] = @book.errors.full_messages.join(', ')
          format.html { redirect_to new_admin_book_path(@book) }
        end
      end
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Book.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information

    private

    def book_params
      params.require(:book).permit(
        :author_id,
        :genre_id,
        :title,
        :published,
        :hours,
        :pages,
        :amazon_url,
        :audible_url
      ).merge(
        user: current_user
      )
    end


  end
end
