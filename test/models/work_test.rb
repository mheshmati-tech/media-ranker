require "test_helper"

describe Work do
  describe "validations" do
    #Arrange
    before do
      @album = works(:superdream)
      @book = works(:becoming)
      @movie = works(:forrest_gump)
    end

    it "is valid when all fields are present" do
      expect(@album.valid?).must_equal true
      expect(@book.valid?).must_equal true
      expect(@movie.valid?).must_equal true
    end

    it "is invalid without a title" do
      @album.title = nil
      @book.title = nil
      @movie.title = nil

      album_result = @album.valid?
      book_result = @book.valid?
      movie_result = @movie.valid?

      expect(album_result).must_equal false
      expect(@album.errors.messages).must_include :title

      expect(book_result).must_equal false
      expect(@book.errors.messages).must_include :title

      expect(movie_result).must_equal false
      expect(@movie.errors.messages).must_include :title
    end

    it "is invalid without a creator" do
      @album.creator = nil
      @book.creator = nil
      @movie.creator = nil

      album_result = @album.valid?
      book_result = @book.valid?
      movie_result = @movie.valid?

      expect(album_result).must_equal false
      expect(@album.errors.messages).must_include :creator

      expect(book_result).must_equal false
      expect(@book.errors.messages).must_include :creator

      expect(movie_result).must_equal false
      expect(@movie.errors.messages).must_include :creator
    end

    it "is invalid without a valid integer publication year" do
      @album.publication_year = nil
      @book.publication_year = 98
      @movie.publication_year = "1998"

      album_result = @album.valid?
      book_result = @book.valid?
      movie_result = @movie.valid?

      expect(album_result).must_equal false
      expect(@album.errors.messages).must_include :publication_year

      expect(book_result).must_equal false
      expect(@book.errors.messages).must_include :publication_year

      expect(movie_result).must_equal false
      expect(@movie.errors.messages).must_include :publication_year
    end

    it "is invalid without a description" do
      @album.description = nil
      @book.description = nil
      @movie.description = nil

      album_result = @album.valid?
      book_result = @book.valid?
      movie_result = @movie.valid?

      expect(album_result).must_equal false
      expect(@album.errors.messages).must_include :description

      expect(book_result).must_equal false
      expect(@book.errors.messages).must_include :description

      expect(movie_result).must_equal false
      expect(@movie.errors.messages).must_include :description
    end
  end
  describe 'relations' do 
    it 'has a vote' do 

    end
    
    it 'can set the vote' do 

    end
  end
end
