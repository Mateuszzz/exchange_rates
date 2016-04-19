describe "User downalods PDF" do
  scenario "with current exchange rates" do
    
    visit(root_path)
    click_link("Current")
    click_link("Save as PDF")
    
    pdf = PDF::Inspector::Text.analyze(page.body)
    
    expect(page.status_code).to equal(200)
    expect(page.response_headers['Content-Type']).to eq("application/pdf")
    expect(page.response_headers['Content-Disposition']).to match(/attachment; filename="exchange_rates_#{Date.today}.pdf"/)  
    expect(pdf.strings).to be_include("Exchange rates of #{Date.today}") 
  end
end  