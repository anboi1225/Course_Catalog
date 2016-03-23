module SearchHelper
  def get_subject_name(sid)
    sid1 = sid.tr('[]', '')
    sid2 = sid1.tr('"', '')
    sid3 = sid2.tr(' ', '')
    sid4 = []
    sid4 = sid3.split(',')
    subject_names = []
    sid4.each do |i|
      subject = Subject.where("sid LIKE ?", "%#{i}%")
      subject.each do |j|
        subject_names.push(j.name)
      end
    end

    return subject_names
  end
end
