class FactsController < ApplicationController
  load_and_authorize_resource
  handles_sortable_columns

  # GET /facts
  # GET /facts.json
  def index

    order = sortable_column_order
    if order =~ /author/
      order = "users.name #{params[:sort].start_with?("-") ? "desc" : "asc"}"
    end
    puts order
    @facts = Fact.joins(:user).order(order)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @facts }
    end
  end

  # GET /facts/1
  # GET /facts/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fact }
    end
  end

  # GET /facts/new
  # GET /facts/new.json
  def new
    @fact = Fact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fact }
    end
  end

  # GET /facts/1/edit
  def edit
  end

  # POST /facts
  # POST /facts.json
  def create
    @fact = Fact.new(params[:fact].merge(:user_id => current_user.id))

    respond_to do |format|
      if @fact.save
        format.html { redirect_to @fact, notice: 'Fact was successfully created.' }
        format.json { render json: @fact, status: :created, location: @fact }
      else
        format.html { render action: "new" }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /facts/1
  # PUT /facts/1.json
  def update

    respond_to do |format|
      if @fact.update_attributes(params[:fact].merge(:user_id => current_user.id))
        format.html { redirect_to @fact, notice: 'Fact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facts/1
  # DELETE /facts/1.json
  def destroy
    @fact.destroy

    respond_to do |format|
      format.html { redirect_to facts_url }
      format.json { head :no_content }
    end
  end
end
