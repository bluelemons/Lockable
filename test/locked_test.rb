require 'test_helper'

class LockedTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Locked
  end

  test 'Person can update initially' do
    person = Person.new
    person.name = "new name"
    assert_equal person.valid?, true
  end

  test 'Person cant be save if isnt lock' do
    person = Person.new
    person.save
    person.lock!
    assert_equal person.locked_at, nil
  end

  test 'Person can lock if all fields are completed' do
    person = Person.new
    person.name = "Oldani Pablo"
    person.save
    person.lock!
    assert_not_equal person.locked_at, nil
    assert_equal person.valid?, true
  end

  test 'Cant update selected fields if person is lock' do
    person = Person.new
    person.name = "Oldani Pablo"
    person.lock!
    person.save
    person.name = "Eloy Espinaco"
    assert_equal person.valid?, false
  end

  test 'Can update no selected fields if person is lock' do
    person = Person.new
    person.name = "Oldani Pablo"
    person.save
    person.lock!
    person.save
    person.age = "30"
    assert_equal person.valid?, true
  end

  test 'Person can be deleted if its locked' do
  end

end
