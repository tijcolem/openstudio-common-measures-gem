# *******************************************************************************
# OpenStudio(R), Copyright (c) 2008-2018, Alliance for Sustainable Energy, LLC.
# All rights reserved.
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# (1) Redistributions of source code must retain the above copyright notice,
# this list of conditions and the following disclaimer.
#
# (2) Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
#
# (3) Neither the name of the copyright holder nor the names of any contributors
# may be used to endorse or promote products derived from this software without
# specific prior written permission from the respective party.
#
# (4) Other than as required in clauses (1) and (2), distributions in any form
# of modifications or other derivative works may not use the "OpenStudio"
# trademark, "OS", "os", or any other confusingly similar designation without
# specific prior written permission from Alliance for Sustainable Energy, LLC.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER(S) AND ANY CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER(S), ANY CONTRIBUTORS, THE
# UNITED STATES GOVERNMENT, OR THE UNITED STATES DEPARTMENT OF ENERGY, NOR ANY OF
# THEIR EMPLOYEES, BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
# OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
# STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# *******************************************************************************

# Reports out information about the OpenStudio environment.
# Used for debugging different runtime environments.
# Messages are put to stdout and returned in an array.
# @return [Array<String>] an array of information about OpenStudio.
def openstudio_information

  require 'json'

  result = {}
  result[:openstudio] = {}

  begin
    require 'openstudio'

    result[:openstudio]['openStudioVersion'] = OpenStudio.openStudioVersion.to_s
    result[:openstudio]['openStudioLongVersion'] = OpenStudio.openStudioLongVersion.to_s
    result[:openstudio]['getOpenStudioModule'] = OpenStudio.getOpenStudioModule.to_s
    result[:openstudio]['getOpenStudioCLI'] = OpenStudio.getOpenStudioCLI.to_s
    result[:openstudio]['getEnergyPlusExecutable'] = OpenStudio.getEnergyPlusExecutable.to_s
    result[:openstudio]['getRadianceDirectory'] = OpenStudio.getRadianceDirectory.to_s
    result[:openstudio]['getPerlExecutable'] = OpenStudio.getPerlExecutable.to_s

  rescue => exception
    result[:openstudio][:error] = exception.backtrace

    pretty_result = JSON.pretty_generate(result)

    puts pretty_result

    return result
  end

  pretty_result = JSON.pretty_generate(result)

  puts pretty_result

  return result
end
