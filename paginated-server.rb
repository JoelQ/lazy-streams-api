require "sinatra/base"
require "json"

class PaginatedServer < Sinatra::Base
  PER_PAGE = 10
  ARRAY_INDEX_OFFSET = 1

  get "/users" do
    page_number = params.fetch("page", 1).to_i
    beginning_boundary = (page_number - ARRAY_INDEX_OFFSET) * PER_PAGE
    end_boundary = beginning_boundary + PER_PAGE - ARRAY_INDEX_OFFSET

    if beginning_boundary > data.length
      status 404
    else
      headers "Content-Type" => "application/json"
      data[beginning_boundary..end_boundary].to_json
    end
  end

  private

  def data
    [
      { id: 1, name: "Noah", births: 19_511 },
      { id: 2, name: "Emma", births: 20_355 },
      { id: 3, name: "Liam", births: 18_281 },
      { id: 4, name: "Olivia", births: 19_553 },
      { id: 5, name: "Mason", births: 16_535 },
      { id: 6, name: "Sophia", births: 17_327 },
      { id: 7, name: "Jacob", births: 15_816 },
      { id: 8, name: "Ava", births: 16_286 },
      { id: 9, name: "William", births: 15_809 },
      { id: 10, name: "Isabella", births: 15_504 },
      { id: 11, name: "Ethan", births: 14_991 },
      { id: 12, name: "Mia", births: 14_820 },
      { id: 13, name: "James", births: 14_705 },
      { id: 14, name: "Abigail", births: 12_311 },
      { id: 15, name: "Alexander", births: 14_460 },
      { id: 16, name: "Emily", births: 11_727 },
      { id: 17, name: "Michael", births: 14_321 },
      { id: 18, name: "Charlotte", births: 11_332 },
      { id: 19, name: "Benjamin", births: 13_608 },
      { id: 20, name: "Harper", births: 10_241 },
      { id: 21, name: "Elijah", births: 13_511 },
      { id: 22, name: "Madison", births: 10_038 },
      { id: 23, name: "Daniel", births: 13_408 },
      { id: 24, name: "Amelia", births: 9_795 },
      { id: 25, name: "Aiden", births: 13_378 },
      { id: 26, name: "Elizabeth", births: 9_656 },
      { id: 27, name: "Logan", births: 12_862 },
      { id: 28, name: "Sofia", births: 9_650 },
      { id: 29, name: "Matthew", births: 12_648 },
      { id: 30, name: "Evelyn", births: 9_313 },
      { id: 31, name: "Lucas", births: 12_246 },
      { id: 32, name: "Avery", births: 9_298 },
      { id: 33, name: "Jackson", births: 12_182 },
      { id: 34, name: "Chloe", births: 7_884 },
      { id: 35, name: "David", births: 11_691 },
      { id: 36, name: "Ella", births: 7_852 },
      { id: 37, name: "Oliver", births: 11_592 },
      { id: 38, name: "Grace", births: 7_589 },
      { id: 39, name: "Jayden", births: 11_475 },
      { id: 40, name: "Victoria", births: 7_575 },
    ]
  end
end
