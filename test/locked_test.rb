require 'test_helper'

class LockedTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Locked
  end

  test 'Person can be updated initially' do
    person = Person.new
    person.name = "new name"
    assert person.valid?
  end

  test 'Person cant be locked if all fields arent completed' do
    person = Person.new
    person.save
    person.lock!
    #assert_raise RuntimeError {person.lock!}
    assert_equal nil, person.locked_at
  end

  test 'Person can be locked if all fields are completed' do
    person = Person.new
    person.name = "Oldani Pablo"
    person.save
    person.lock
    assert_not_equal nil, person.locked_at
    assert person.valid?
  end

  test 'Cant update selected fields if person is locked' do
    person = Person.new
    person.name = "Oldani Pablo"
    person.save
    person.lock!
    person.name = "Eloy Espinaco"
    assert_equal false, person.valid?
  end

  test 'Can update no selected fields if person is locked' do
    person = Person.new
    person.name = "Oldani Pablo"
    person.save
    person.lock!
    person.age = "30"
    assert person.valid?
  end

  test 'Person cant be deleted if its locked' do
  end

end
