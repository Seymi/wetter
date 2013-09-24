class PinnacleFeedsController < ApplicationController
  # GET /pinnacle_feeds
  # GET /pinnacle_feeds.json
  def index
    #@pinnacle_feeds = PinnacleFeed.all.reverse
    @pinnacle_feeds = PinnacleFeed.where(['created_at >= ?',  Date.today-3] ).reverse

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pinnacle_feeds }
    end
  end

  # GET /pinnacle_feeds/1
  # GET /pinnacle_feeds/1.json
  def show
    @pinnacle_feed = PinnacleFeed.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pinnacle_feed }
    end
  end

  # GET /pinnacle_feeds/new
  # GET /pinnacle_feeds/new.json
  def new
    @pinnacle_feed = PinnacleFeed.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pinnacle_feed }
    end
  end

  # GET /pinnacle_feeds/1/edit
  def edit
    @pinnacle_feed = PinnacleFeed.find(params[:id])
  end

  # POST /pinnacle_feeds
  # POST /pinnacle_feeds.json
  def create
    @pinnacle_feed = PinnacleFeed.new(params[:pinnacle_feed])

    respond_to do |format|
      if @pinnacle_feed.save
        format.html { redirect_to @pinnacle_feed, notice: 'Pinnacle feed was successfully created.' }
        format.json { render json: @pinnacle_feed, status: :created, location: @pinnacle_feed }
      else
        format.html { render action: "new" }
        format.json { render json: @pinnacle_feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pinnacle_feeds/1
  # PUT /pinnacle_feeds/1.json
  def update
    @pinnacle_feed = PinnacleFeed.find(params[:id])

    respond_to do |format|
      if @pinnacle_feed.update_attributes(params[:pinnacle_feed])
        format.html { redirect_to @pinnacle_feed, notice: 'Pinnacle feed was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pinnacle_feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pinnacle_feeds/1
  # DELETE /pinnacle_feeds/1.json
  def destroy
    @pinnacle_feed = PinnacleFeed.find(params[:id])
    @pinnacle_feed.destroy

    respond_to do |format|
      format.html { redirect_to pinnacle_feeds_url }
      format.json { head :no_content }
    end
  end
end
