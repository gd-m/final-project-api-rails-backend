class Api::V1::NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]

  # GET /notes
  def index
    @notes = Note.all
    notes_json = NoteSerializer.new(@notes).serialized_json
    render json: notes_json
  end

  # GET /notes/1
  def show
    note_json = NoteSerializer.new(@note).serialized_json
    render json: note_json
  end

  # POST /notes
  def create
    @note = Note.new(note_params)

    if @note.save
      note_json = NoteSerializer.new(@note).serialized_json
      render json: note_json, status: :created, location: @note
    else
      note_json = NoteSerializer.new(@note).serialized_json
      render json: note_json.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      note_json = NoteSerializer.new(@note).serialized_json
    render json: note_json
    else
      note_json = NoteSerializer.new(@note).serialized_json
    render json: note_json.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  def destroy
    @note.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def note_params
      params.require(:note).permit(:content, :belongs_to, :belongs_to)
    end
end
