require "test_helper"

describe Work do
  before do
    @album = works(:superdream)
    @book = works(:becoming)
    @movie = works(:forrest_gump)
  end
  describe "validations" do
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
      @movie.publication_year = "198"

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
  describe "relations" do
    it "has votes" do
      vote = votes(:vote_superdream)
      anotha_vote = votes(:vote_superdream_2)

      expect(@album.votes).must_include vote
      expect(@album.votes).must_include anotha_vote

      expect(@album.votes.count).must_equal 2
      @album.votes.each do |vote|
        expect(vote).must_be_instance_of Vote
      end
    end
  end
  describe "custom methods" do
    describe "media descending" do
      it "should display elements in descending order depending on their votes" do
        work = Work.create(category: "album", title: "gemini", creator: "Macklemore", publication_year: 2017, description: "not as sick of an album so gets no votes :(")
        expect(@album.votes.count).must_equal 2
        expect(work.votes.count).must_equal 0

        expect(Work.albums.first).must_equal @album
        expect(Work.albums.last).must_equal work
      end
    end
    describe "spotlight" do
      it "must present the work with the most votes" do
        expect(Work.spotlight).must_equal @album
      end
    end
    describe "top_ten" do
      it "should render work with votes" do
        expect(Work.top_ten_albums).must_include @album
        expect(Work.top_ten_books).must_include @book
      end
      it "should render the work with the highest vote first" do
        expect(Work.top_ten_albums.first).must_equal @album
      end
      it "should not include media with no votes" do
        expect(Work.top_ten_movies).wont_include @movie
      end
    end
  end
end
