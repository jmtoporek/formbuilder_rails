require 'rails_helper'

RSpec.describe Configurator, type: :model do

  it "has a valid factory" do
    expect(build(:configurator)).to be_valid
  end

  describe "name" do

    it "is valid with a name" do
      c = build(:configurator)
      expect(c).to be_valid
    end

    it "is invalid with a blank name" do
      #c = Configurator.new(name: "")
      c = build(:configurator, name: "")
      c.valid?
      expect(c.errors[:name]).to include("can't be blank")
    end

    it "is invalid with no name value passed" do
      c = build(:configurator, name: nil)
      c.valid?
      expect(c.errors[:name]).to include("can't be blank")
    end

    it "strips out leading and trailing spaces in name" do
      cname = "  configurator with trailing and leading space  "
      c = create(:configurator, name: cname)
      c.valid?
      expect(c.name).to eq(cname.strip)
    end

  end

  describe "automatically created values for slug and key" do
    
    describe "key" do
      
      it "it automatically sets key on create" do
        config = create(:configurator)
        config.valid?
        expect(config.key).not_to be(nil)
        expect(config.key.length).to be(20)
      end
      
      it "it leaves key unchanged on updated configurator" do
        config = create(:configurator)
        expect(config.key.length).to be(20)
        old_key = config.key
        config.name = "modified name"
        config.save
        expect(config.key).to eq(old_key)
      end
    end
    
    describe "slug" do

      it "it automatically sets slug on create" do
        cname = "This is a test, ya'll!"
        config = create(:configurator, name: cname)
        expect(config.slug).to eq(cname.parameterize)
      end
      
      it "it updates slug value on update" do
        c_name_old = "new configurator"
        config = create(:configurator, name: c_name_old)
        expect(config.slug).to eq(c_name_old.parameterize)
        c_name_new = "edited configurator"
        config.name = c_name_new
        config.save
        expect(config.slug).to eq(c_name_new.parameterize)
      end

      it "automatically generates unique slug when a new configurator is created with same name as existing configurator" do
        c_name   = "test uno"
        c1_slug  = c_name.parameterize
        c1a_slug = c1_slug + "-1"
    
        c1 = create(:configurator, name: c_name)
        expect(c1.slug).to eq(c1_slug)
        c1a = create(:configurator, name: c_name)
        expect(c1a.slug).to eq(c1a_slug)
      end
      
    end

  end

end