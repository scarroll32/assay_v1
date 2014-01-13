require 'test_helper'

class AmpliseqsControllerTest < ActionController::TestCase
  setup do
    @ampliseq = ampliseqs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ampliseqs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ampliseq" do
    assert_difference('Ampliseq.count') do
      post :create, ampliseq: { abbrevtd: @ampliseq.abbrevtd, accession_number: @ampliseq.accession_number, amplicon_id: @ampliseq.amplicon_id, cosmic_mut_id: @ampliseq.cosmic_mut_id, gene: @ampliseq.gene, hg19_coordinates: @ampliseq.hg19_coordinates, mut_syntax_aa: @ampliseq.mut_syntax_aa, mut_syntax_cds: @ampliseq.mut_syntax_cds, strand: @ampliseq.strand }
    end

    assert_redirected_to ampliseq_path(assigns(:ampliseq))
  end

  test "should show ampliseq" do
    get :show, id: @ampliseq
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ampliseq
    assert_response :success
  end

  test "should update ampliseq" do
    put :update, id: @ampliseq, ampliseq: { abbrevtd: @ampliseq.abbrevtd, accession_number: @ampliseq.accession_number, amplicon_id: @ampliseq.amplicon_id, cosmic_mut_id: @ampliseq.cosmic_mut_id, gene: @ampliseq.gene, hg19_coordinates: @ampliseq.hg19_coordinates, mut_syntax_aa: @ampliseq.mut_syntax_aa, mut_syntax_cds: @ampliseq.mut_syntax_cds, strand: @ampliseq.strand }
    assert_redirected_to ampliseq_path(assigns(:ampliseq))
  end

  test "should destroy ampliseq" do
    assert_difference('Ampliseq.count', -1) do
      delete :destroy, id: @ampliseq
    end

    assert_redirected_to ampliseqs_path
  end
end
