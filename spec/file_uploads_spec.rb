# TO DELETE (merged with Order)

# require 'spec_helper'
#
# describe 'File Upload Controller' do
#   context 'get /uploads/new route' do
#     it 'should respond successfully to the /uploads/new route' do
#       get '/uploads/new'
#       expect(last_response.status).to eq(200)
#     end
#
#     it 'should display a form' do
#       get '/uploads/new'
#       expect(last_response.body).to include('<form id=\'upload-form\'')
#     end
#
#   end
#
# # CHANGE CONTROLLER TO REDIRECT
#   xcontext 'post /uploads route' do
#     it 'should give a status of 302 after submission' do
#       expect(last_response.status).to eq(302)
#     end
#
#     it 'should display a form' do
#       get '/uploads/new'
#       expect(last_response.body).to include('<form id=\'upload-form\'')
#     end
#
#     it 'should redirect to /uploads after submission' do
#       post '/uploads'
#       expect(last_response.location).to include('/uploads')
#     end
#   end
#
# end
