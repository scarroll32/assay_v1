require 'test_helper'

class CosmicsControllerTest < ActionController::TestCase
  setup do
    @cosmic = cosmics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cosmics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cosmic" do
    assert_difference('Cosmic.count') do
      post :create, cosmic: { accession_number: @cosmic.accession_number, chromosome: @cosmic.chromosome, cosmic_mut_id: @cosmic.cosmic_mut_id, cosmic_release: @cosmic.cosmic_release, doc: @cosmic.doc, examined_samples: @cosmic.examined_samples, gene: @cosmic.gene, grch37_start: @cosmic.grch37_start, grch37_stop: @cosmic.grch37_stop, mut_aa: @cosmic.mut_aa, mut_description: @cosmic.mut_description, mut_freq: @cosmic.mut_freq, mut_nt: @cosmic.mut_nt, mut_syntax_aa: @cosmic.mut_syntax_aa, mut_syntax_cds: @cosmic.mut_syntax_cds, mutated_samples: @cosmic.mutated_samples, tumour_site: @cosmic.tumour_site }
    end

    assert_redirected_to cosmic_path(assigns(:cosmic))
  end

  test "should show cosmic" do
    get :show, id: @cosmic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cosmic
    assert_response :success
  end

  test "should update cosmic" do
    put :update, id: @cosmic, cosmic: { accession_number: @cosmic.accession_number, chromosome: @cosmic.chromosome, cosmic_mut_id: @cosmic.cosmic_mut_id, cosmic_release: @cosmic.cosmic_release, doc: @cosmic.doc, examined_samples: @cosmic.examined_samples, gene: @cosmic.gene, grch37_start: @cosmic.grch37_start, grch37_stop: @cosmic.grch37_stop, mut_aa: @cosmic.mut_aa, mut_description: @cosmic.mut_description, mut_freq: @cosmic.mut_freq, mut_nt: @cosmic.mut_nt, mut_syntax_aa: @cosmic.mut_syntax_aa, mut_syntax_cds: @cosmic.mut_syntax_cds, mutated_samples: @cosmic.mutated_samples, tumour_site: @cosmic.tumour_site }
    assert_redirected_to cosmic_path(assigns(:cosmic))
  end

  test "should destroy cosmic" do
    assert_difference('Cosmic.count', -1) do
      delete :destroy, id: @cosmic
    end

    assert_redirected_to cosmics_path
  end
end
