# Move to Order Controller spec

require 'spec_helper'

xdescribe "ItemSearchHelpers" do

  subject do
    Class.new { include ItemSearchHelpers }
  end

  xcontext "#find_sku" do
    context "valid params" do

      it "should find the product with the given product id" do
      end

      it "should find the influencer with the given influencer id" do
      end

      it "should find the product variant for the specific customer" do
      end

      it "should return the sku of the specific product" do
      end

    end

    xcontext "invalid params" do
    end

  end

  context "#create_influencer_orders" do
    context "valid params" do

      it "should create a new influencer order in the database" do
      end

      it "should create an influencer order belonging to the given monthly order id" do
      end

      it "should create an influencer order belonging to the given influencer" do
      end

      context "three items" do

        it "should create 3 new line items for the order" do
        end

        it "should create each line item using the appropriate sku and vairant id" do
        end

      end

      context "five items" do

        it "should create 5 new line items for the order" do
        end

        it "should create each line item using the appropriate sku and vairant id" do
        end

      end
    end

    xcontext "invalid params" do
    end
  end

end
