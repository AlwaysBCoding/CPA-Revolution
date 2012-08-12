require 'test_helper'

class StatesControllerTest < ActionController::TestCase
  setup do
    @state = states(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create state" do
    assert_difference('State.count') do
      post :create, state: { abbr: @state.abbr, age_requirement: @state.age_requirement, citizenship_requirement: @state.citizenship_requirement, education_requirement: @state.education_requirement, ethics_requirements: @state.ethics_requirements, experience_requirements: @state.experience_requirements, hours_requirement: @state.hours_requirement, international_examination_program: @state.international_examination_program, name: @state.name, notes: @state.notes, residency_requirement: @state.residency_requirement, sitting_requirements: @state.sitting_requirements, ssn_requirement: @state.ssn_requirement }
    end

    assert_redirected_to state_path(assigns(:state))
  end

  test "should show state" do
    get :show, id: @state
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @state
    assert_response :success
  end

  test "should update state" do
    put :update, id: @state, state: { abbr: @state.abbr, age_requirement: @state.age_requirement, citizenship_requirement: @state.citizenship_requirement, education_requirement: @state.education_requirement, ethics_requirements: @state.ethics_requirements, experience_requirements: @state.experience_requirements, hours_requirement: @state.hours_requirement, international_examination_program: @state.international_examination_program, name: @state.name, notes: @state.notes, residency_requirement: @state.residency_requirement, sitting_requirements: @state.sitting_requirements, ssn_requirement: @state.ssn_requirement }
    assert_redirected_to state_path(assigns(:state))
  end

  test "should destroy state" do
    assert_difference('State.count', -1) do
      delete :destroy, id: @state
    end

    assert_redirected_to states_path
  end
end
